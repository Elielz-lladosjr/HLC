type Props = {
  id?: number;              
  name: string;
  img: string;
  hp?: number;
  attack?: number;
  defense?: number;
  xp?: number;
  level?: number | string;  
};

export default function Card({ id, name, img, hp, attack, defense, xp, level }: Props) {
  return (
    <div className="card">
      <img className="poke-img" src={img} alt={name} />

      <h3>
        {id && <span className="poke-id">#{id}</span>} {name}
      </h3>

      <div className="stats">
        {level !== undefined && (
          <p>
            <strong>Level:</strong> {level === "" ? "Unknown" : level}
          </p>
        )}

        {hp !== undefined && <p><strong>HP:</strong> {hp}</p>}
        {attack !== undefined && <p><strong>ATK:</strong> {attack}</p>}
        {defense !== undefined && <p><strong>DEF:</strong> {defense}</p>}
        {xp !== undefined && <p><strong>XP:</strong> {xp}</p>}
      </div>
    </div>
  );
}
