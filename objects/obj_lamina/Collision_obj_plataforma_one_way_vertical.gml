with (other) // Loop através de todas as instâncias da plataforma colidida
{
    var _inst = instance_place(x, y - 1, obj_inimigo); // Verifica se há inimigos uma célula acima da plataforma

    if (_inst != noone) // Se houver inimigos
    {
        // Destrua tanto a plataforma quanto os inimigos
        instance_destroy();
        with (_inst)
        {
            instance_destroy();
        }
    }
    else // Se não houver inimigos, apenas destrua a plataforma
    {
        instance_destroy();
    }
}

