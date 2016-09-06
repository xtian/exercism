extern crate chrono;
use chrono::*;

pub fn after(birth_date: DateTime<UTC>) -> DateTime<UTC> {
    birth_date + Duration::seconds(10_i64.pow(9))
}
