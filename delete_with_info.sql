do $$ 
Declare
    reg int;
begin 
  for reg in select id from emp group by id loop
        delete from emp where id = reg;
	raise info 'information message %', reg ;
  end loop;

end $$;

