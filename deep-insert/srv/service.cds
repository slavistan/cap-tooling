using { ns } from '../db/schema.cds';

service AdminService @(path:'/admin') {
    entity Students as projection on ns.Students;
}