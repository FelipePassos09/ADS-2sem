def remove(self, valor): 
    
    if self.head.data == valor: 
        self.head = self.head.nextItem 
        
    else:
        before = None 
        navegar = self.head
        
        while navegar and navegar.data != valor: 
            
            before = navegar 
            navegar = navegar.nextItem
            
            if navegar: 
                before.nextItem = navegar.nextItem 
            else: 
                before.nextItem = None

class Person(object):
    def set_name(person, name):
        if len(name) >= 2:
            person.name = name

woman = Person()
woman.set_name('Juliana')

print(woman.name)
