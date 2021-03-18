using { ns } from '../db/schema.cds';

service ShopService @(path:'/shop') {
    entity Orders as projection on ns.Orders;
}