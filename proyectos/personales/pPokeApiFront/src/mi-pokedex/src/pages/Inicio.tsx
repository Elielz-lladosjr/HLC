import { useEffect, useState } from "react";
import Card from "../components/Card";

export default function Inicio() {
  const [poke, setPoke] = useState<any>(null);

  useEffect(() => {
    const id = Math.floor(Math.random() * 386) + 1;
    fetch(`https://pokeapi.co/api/v2/pokemon/${id}`)
      .then(res => res.json())
      .then(data => setPoke(data));
  }, []);

  return (
    <div className="inicio-container">
      <h2>Pokémon del día</h2>

      {poke && (
        <Card
          key={poke.id}
          name={poke.name}
          img={poke.sprites.other["official-artwork"].front_default}
          hp={poke.stats[0].base_stat}
          attack={poke.stats[1].base_stat}
          defense={poke.stats[2].base_stat}
          xp={poke.base_experience}
        />
      )}
    </div>
  );
}
