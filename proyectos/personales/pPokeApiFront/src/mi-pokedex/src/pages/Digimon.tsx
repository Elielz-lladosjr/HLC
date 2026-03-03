import { useEffect, useState } from "react";
import Card from "../components/Card";

export default function Digimon() {
  const [digis, setDigis] = useState<any[]>([]);

  useEffect(() => {
    async function load() {
      const data = await fetch("https://digimon-api.vercel.app/api/digimon")
        .then(r => r.json());

      const random10 = Array.from({ length: 10 }, () => {
        const index = Math.floor(Math.random() * data.length);
        const digi = data[index];

        return {
          ...digi,
          hp: Math.floor(Math.random() * 100) + 50,        
          attack: Math.floor(Math.random() * 50) + 20,     
          defense: Math.floor(Math.random() * 50) + 20,    
          xp: Math.floor(Math.random() * 1000) + 100,      
        };
      });

      setDigis(random10);
    }
    load();
  }, []);

  return (
    <div className="digimon-grid">
      {digis.map((d, i) => (
        <Card
          key={i}
          name={d.name}
          img={d.img}
          level={d.level || "Unknown"}
          hp={d.hp}
          attack={d.attack}
          defense={d.defense}
          xp={d.xp}
        />
      ))}
    </div>
  );
}
