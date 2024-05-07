//-------------------------------
//BrightBloom_ps20.hlsl
// High-pass filter for obtaining luminance
// We use an aproximation formula that is pretty fast:
//   f(x) = ( -3 * ( x - 1 )^2 + 1 ) * 2
//   Color += f(Color)
//-------------------------------

float4 main(float2 texCoord: TEXCOORD0,
		uniform sampler RT: register(s0)
		) : COLOR {
	float4 tex = tex2D(RT,   texCoord);

  // Use luminance to apply a white bright
	//tex -= 1.0f;
	//float4 bright4= -6.0f * tex * tex + 2.0f; // Equivalent to ( -3.0f * tex * tex + 1.0f ) * 2.0f;
	//float bright = dot( bright4, float4( 0.333333f, 0.333333f, 0.333333f, 0.0f) );
	//tex += bright + 0.6f;
	



  // Use luminance to apply a white bright
  //tex = min( 1.0f, 2.0f * tex );
	//tex -= 1.0f;
	//float4 bright4= -1.0f * tex * tex + 1.0f; // Equivalent to ( -3 * tex * tex + 1 ) * 2;
	//float bright = dot( bright4, float4( 0.333333f, 0.333333f, 0.333333f, 0.0f) );
	//tex += ( bright + 0.6f );
  //return tex;




  // Use luminance to apply a colour modification
  tex = 2.0f * tex;
  float bright = dot( tex, float4( 0.333333f, 0.333333f, 0.333333f, 0.0f) ) - 1.0f;
	bright = -6.0f * bright * bright + 2.0f; // Equivalent to ( -3.0f * bright * bright + 1.0f ) * 2.0f;
	
	return tex + 3.0f * ( bright + 0.6f );
}
