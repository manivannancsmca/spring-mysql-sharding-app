package com.spring_mysql_sharding_app.util;

import com.google.common.hash.Hashing;
import java.nio.charset.StandardCharsets;
import java.util.SortedMap;
import java.util.TreeMap;

public class ConsistentHashRouter {

    // 1. ஹேஷ் வளையத்தை (Hash Ring) உருவாக்க TreeMap பயன்படுத்துகிறோம்
    private final SortedMap<Integer, String> ring = new TreeMap<>();
    
    // 2. Virtual Nodes: ஒரு டேட்டாபேஸ் வட்டத்தில் பல இடங்களில் பிரதிபலிக்க (சமமாக தரவை பிரிக்க உதவும்)
    private final int numberOfReplicas = 100; 

    public ConsistentHashRouter(int shardCount) {
        // ஆரம்பத்தில் உள்ள ஷார்ட்டுகளை வளையத்தில் சேர்க்கிறோம்
        for (int i = 1; i <= shardCount; i++) {
            addShard("shard" + i);
        }
    }

    // புதிய ஷார்ட்டை எளிதாக இணைக்க
    public void addShard(String shardName) {
        for (int i = 0; i < numberOfReplicas; i++) {
            int hash = getHash(shardName + "-vn-" + i);
            ring.put(hash, shardName);
        }
    }

    // UUID-க்கான சரியான ஷார்ட்டை வளையத்தில் இருந்து கண்டறிதல்
    public String getShard(String uuid) {
        if (ring.isEmpty()) {
            return null;
        }
        int hash = getHash(uuid);
        
        // இந்த ஹேஷ் மதிப்புக்கு சமமான அல்லது அதற்கு அடுத்ததாக வட்டத்தில் இருக்கும் புள்ளியைக் கண்டறிகிறோம்
        if (!ring.containsKey(hash)) {
            SortedMap<Integer, String> tailMap = ring.tailMap(hash);
            hash = tailMap.isEmpty() ? ring.firstKey() : tailMap.firstKey();
        }
        return ring.get(hash);
    }

    // Guava Murmur3 ஹேஷிங்
    private int getHash(String key) {
        return Hashing.murmur3_32_fixed().hashString(key, StandardCharsets.UTF_8).asInt();
    }
}