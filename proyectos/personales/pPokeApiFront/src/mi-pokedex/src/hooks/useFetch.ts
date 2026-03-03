import { useEffect, useState } from "react";

export function useFetch(url: string) {
  const [data, setData] = useState<any>(null);

  useEffect(() => {
    fetch(url)
      .then(res => res.json())
      .then(setData);
  }, [url]);

  return data;
}
import Card from "../components/Card"