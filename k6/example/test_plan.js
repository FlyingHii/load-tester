import http from 'k6/http';
import { sleep } from 'k6';

const config = JSON.parse(open('./config.json'));

export const options = {
  vus: config.vus,
  duration: config.duration,
};

export default function () {
  http.get(config.endpoint);
  sleep(0.1);
}
