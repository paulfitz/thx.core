package thx.core;

import Map;
import thx.core.Tuple;
using thx.core.Iterators;
using thx.core.Arrays;

/**
Extension methods for Maps
**/
class Maps {
/**
Converts a Map<TKey, TValue> into an Array<Tuple2<TKey, TValue>>
**/
  public static function tuples<TKey, TValue>(map: IMap<TKey, TValue>): Array<Tuple2<TKey, TValue>>
    return map.keys().map(function(key)
      return new Tuple2(key, map.get(key))
    );

/**
`mapToObject` transforms a `Map<String, T>` into an anonymous object.
**/
  public static function mapToObject<T>(map : Map<String, T>) : {}
    return tuples(map).reduce(function(o, t) {
      Reflect.setField(o, t._0, t._1);
      return o;
    }, {});
}
