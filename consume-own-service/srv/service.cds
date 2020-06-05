using { nasp } from '../db/schema.cds';

service TrivialService @(path:'/srv') {
    function foo() returns Integer;
    function bar() returns Integer;
}   