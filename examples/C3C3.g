#! @Chunk C3C3

LoadPackage( "CatReps" );

#! @Example
qc3c3 := RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" );
#! q(2)[a:1->1,b:1->2,c:2->2]
HOMALG_MATRICES.PreferDenseMatrices := true;
#! true
GF3 := HomalgRingOfIntegers( 3 );
#! GF(3)
GF3q := PathAlgebra( GF3, qc3c3 );
#! GF(3) * q
rel := [GF3q.a^3-GF3q.1, GF3q.c^3-GF3q.2, GF3q.a*GF3q.b-GF3q.b*GF3q.c];;
kq := Algebroid( GF3q, rel );
#! Algebroid generated by the right quiver q(2)[a:1->1,b:1->2,c:2->2]
#! @EndExample

#! A representation of the category c3c3 is another way to encode
#! a module homomorphism between two modules over the cyclic group $C_3$ of order $3$:
#! The vector space underlying the first module is the given by the value of (1).
#! The action of C3 on the first module is given by the value of (a).
#! The vector space underlying the second module is the given by the value of (2).
#! The action on the second module is given by the value of (c).
#! The above relation of the quiver states that the value of (b) is
#! a module homomorphism from the first to the second $C_3$-module.

#! Now we add the bialgebroid structure:

#! @Example
counit := rec( a := 1, b := 1, c := 1 );
#! rec( a := 1, b := 1, c := 1 )
kq2 := kq^2;
#! Algebroid generated by the right quiver qxq(1x1,1x2,2x1,2x2)\
#! [1xa:1x1->1x1,1xb:1x1->1x2,1xc:1x2->1x2,2xa:2x1->2x1,2xb:2x1->2x2,2xc:2x2->2x2,\
#! ax1:1x1->1x1,ax2:1x2->1x2,bx1:1x1->2x1,bx2:1x2->2x2,cx1:2x1->2x1,cx2:2x2->2x2]
PreCompose( kq2.ax1, kq2.1xa ) = PreCompose( kq2.1xa, kq2.ax1 );
#! true
PreCompose( kq2.bx1, kq2.2xb ) = PreCompose( kq2.1xb, kq2.bx2 );
#! true
PreCompose( kq2.cx2, kq2.2xc ) = PreCompose( kq2.2xc, kq2.cx2 );
#! true
comult := rec( a := PreCompose( kq2.ax1, kq2.1xa ),
               b := PreCompose( kq2.1xb, kq2.bx2 ),
               c := PreCompose( kq2.cx2, kq2.2xc ) );
#! rec( a := (1x1)-[{ Z(3)^0*(1xa*ax1) }]->(1x1),
#!      b := (1x1)-[{ Z(3)^0*(1xb*bx2) }]->(2x2),
#!      c := (2x2)-[{ Z(3)^0*(2xc*cx2) }]->(2x2) )
AddBialgebroidStructure( kq, counit, comult );
#! Bialgebroid generated by the right quiver q(2)[a:1->1,b:1->2,c:2->2]
counit := Counit( kq );
#! Functor from finitely presented Bialgebroid generated by
#! the right quiver q(2)[a:1->1,b:1->2,c:2->2] ->
#! Algebra generated by the right quiver *(1)[]
comult := Comultiplication( kq );
#! Functor from finitely presented Bialgebroid generated by
#! the right quiver q(2)[a:1->1,b:1->2,c:2->2] ->
#! Algebroid generated by the right quiver qxq(1x1,1x2,2x1,2x2)
#! [1xa:1x1->1x1,1xb:1x1->1x2,1xc:1x2->1x2,2xa:2x1->2x1,2xb:2x1->2x2,2xc:2x2->2x2,\
#! ax1:1x1->1x1,ax2:1x2->1x2,bx1:1x1->2x1,bx2:1x2->2x2,cx1:2x1->2x1,cx2:2x2->2x2]
#! @EndExample

#! @Example
kmat := MatrixCategory( GF3 );
#! Category of matrices over GF(3)
CatReps := Hom( kq, kmat );
#! The category of functors: Bialgebroid generated by the right quiver
#! q(2)[a:1->1,b:1->2,c:2->2] -> Category of matrices over GF(3)
CommutativeRingOfLinearCategory( CatReps );
#! GF(3)
zero := ZeroObject( CatReps );
#! <(1)->0, (2)->0; (a)->0x0, (b)->0x0, (c)->0x0>
Display( zero );
#! An object in The category of functors: Bialgebroid generated by the
#! right quiver q(2)[a:1->1,b:1->2,c:2->2] -> Category of matrices
#! over GF(3) defined by the following data:
#! 
#! 
#! Image of <(1)>:
#! A vector space object over GF(3) of dimension 0
#! 
#! Image of <(2)>:
#! A vector space object over GF(3) of dimension 0
#! 
#! Image of (1)-[{ Z(3)^0*(a) }]->(1):
#! (an empty 0 x 0 matrix)
#! 
#! A zero, identity morphism in Category of matrices over GF(3)
#! 
#! 
#! Image of (1)-[{ Z(3)^0*(b) }]->(2):
#! (an empty 0 x 0 matrix)
#! 
#! A zero, identity morphism in Category of matrices over GF(3)
#! 
#! 
#! Image of (2)-[{ Z(3)^0*(c) }]->(2):
#! (an empty 0 x 0 matrix)
#! 
#! A zero, identity morphism in Category of matrices over GF(3)
const := TensorUnit( CatReps );
#! <(1)->1, (2)->1; (a)->1x1, (b)->1x1, (c)->1x1>
Display( const );
#! An object in The category of functors: Bialgebroid generated by the
#! right quiver q(2)[a:1->1,b:1->2,c:2->2] -> Category of matrices
#! over GF(3) defined by the following data:
#! 
#! 
#! Image of <(1)>:
#! A vector space object over GF(3) of dimension 1
#! 
#! Image of <(2)>:
#! A vector space object over GF(3) of dimension 1
#! 
#! Image of (1)-[{ Z(3)^0*(a) }]->(1):
#!  1
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! 
#! Image of (1)-[{ Z(3)^0*(b) }]->(2):
#!  1
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! 
#! Image of (2)-[{ Z(3)^0*(c) }]->(2):
#!  1
#! 
#! A morphism in Category of matrices over GF(3)
d := [[1,1,0,0,0],[0,1,1,0,0],[0,0,1,0,0],[0,0,0,1,1],[0,0,0,0,1]];;
e := [[0,1,0,0],[0,0,1,0],[0,0,0,0],[0,1,0,1],[0,0,1,0]];;
f := [[1,1,0,0],[0,1,1,0],[0,0,1,0],[0,0,0,1]];;
nine := AsObjectInHomCategory( kq, [ 5, 4 ], [ d, e, f ] );
#! <(1)->5, (2)->4; (a)->5x5, (b)->5x4, (c)->4x4>
Display( nine );
#! An object in The category of functors: Bialgebroid generated by the
#! right quiver q(2)[a:1->1,b:1->2,c:2->2] -> Category of matrices
#! over GF(3) defined by the following data:
#! 
#! 
#! Image of <(1)>:
#! A vector space object over GF(3) of dimension 5
#! 
#! Image of <(2)>:
#! A vector space object over GF(3) of dimension 4
#! 
#! Image of (1)-[{ Z(3)^0*(a) }]->(1):
#!  1 1 . . .
#!  . 1 1 . .
#!  . . 1 . .
#!  . . . 1 1
#!  . . . . 1
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! 
#! Image of (1)-[{ Z(3)^0*(b) }]->(2):
#!  . 1 . .
#!  . . 1 .
#!  . . . .
#!  . 1 . 1
#!  . . 1 .
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! 
#! Image of (2)-[{ Z(3)^0*(c) }]->(2):
#!  1 1 . .
#!  . 1 1 .
#!  . . 1 .
#!  . . . 1
#! 
#! A morphism in Category of matrices over GF(3)
nine(kq.1);
#! <A vector space object over GF(3) of dimension 5>
nine(kq.2);
#! <A vector space object over GF(3) of dimension 4>
nine(kq.b);
#! <A morphism in Category of matrices over GF(3)>
Display( nine(kq.b) );
#!  . 1 . .
#!  . . 1 .
#!  . . . .
#!  . 1 . 1
#!  . . 1 .
#! 
#! A morphism in Category of matrices over GF(3)
IsWellDefined( nine );
#! true
fortyone := TensorProductOnObjects( nine, nine );
#! <(1)->25, (2)->16; (a)->25x25, (b)->25x16, (c)->16x16>
IsWellDefined( fortyone );
#! true
fortyone( kq.1 );
#! <A vector space object over GF(3) of dimension 25>
fortyone( kq.2 );
#! <A vector space object over GF(3) of dimension 16>
fortyone(kq.a) = TensorProductOnMorphisms( nine(kq.a), nine(kq.a) );
#! true
fortyone(kq.b) = TensorProductOnMorphisms( nine(kq.b), nine(kq.b) );
#! true
fortyone(kq.c) = TensorProductOnMorphisms( nine(kq.c), nine(kq.c) );
#! true
#! @EndExample
