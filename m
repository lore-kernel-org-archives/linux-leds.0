Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.72.192.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688019;
	b=AGavCNLBPnntGTJ6QBoND9XILtwCG12mXBt+ErEqt75x4txaIctb5DCLVHkzrdEp2FoQ
	 Meile/Ra++BNeqGvL0jpWnVyWQWz6rIsgY5mRUXQQSfoXRspxIAAcL4FptOgE3ozxm/Z0
	 7eMzpWbtzyJTpo2f4j05Zlphh5PN3MTvBiCtu6obzEBRA9D32hKELaA1sR8xQqBeQPJJx
	 x3GQgZ8ttxpMg8C/883pTdu5PC4oAi6e7Tb/e0wlOCX5trPryowtLVoXXBMKbKpd/VSJC
	 2vfMdk5aE5D1cjFzJuW8qS3unpmopOr+wkYcIp/yNLHJJOQqAtfUMCQ5C76r3Qfuxjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688019;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Subject:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=742mOPBZLFtVC0LITLPr861YojQnsN6N3awONH3cbL0=;
	b=alR35q5VOhX0Jm8isAXQdoOkjStCrErLj98j+bHbmssONSP7WW51+s0VKHbWQ2USSJbe
	 hstZcwtPBLnrWSDzSMgnHQG0CMh/yIUbgAIEEv48sikfSvYujQMTMbZxmxzbYKdt4HMK3
	 am4SWNnxoK7ReTrBDsS4d4h/09FFLh/eCqpIylx+aYPa7jUIqn/OJ5yAILZObATo/L3aj
	 vxFKHhPCcm3KDke2XJo8InAGvi2eZbKuIyQbxgNQcxWebm8N2RtUFwOWaTo58Zna7Fr7d
	 cUq7XsQTIEaLQw40Ze8nv5tCO7R6PEQvNjDZ3wGHD9hwuo7QiYsBsc/Ub/8r4GCHuVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=bP1VDU65;
	arc=none smtp.remote-ip=217.72.192.78
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42420606A680
	for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2026 10:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42420606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=bP1VDU65
DKIM2-Signature:  i=1; m=1; t=1795688016;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
 d=web.de;
 s=s29768273:rsa-sha256:PlOO8G+lK5pZsg4S+MiptiEteBe0
   6LnkftUxQ/W5kixAvAoDcBatoFPACP1eB8IRzu2For3k4yHaQ63RGg+sxcq32aZa1zNFS0e6ewP
   E4N1JeVLsCD6zlMAZCV/emDbltrqveIRdPL2Gse1t2NzYoAd0JBicaKFGDNOZ2u1WVMjHMmyfXT
   nW1fD0xaRJDrVLUpAle4VSyN8GRza18CoM+rMpnOh0MlwRczR/kOCrS3rVA83Lg8j7i7bqQkIsa
   WvGzvTuPH/9Awz0jwpDy3zcc4zrsCJwHPMDV9mlA0ZDHL4iVVTAUtSY+aczuN6kkd9WR7df7++d
   ZRZeHEUYpm0Qtg==;
Message-Instance:  m=1;
 h=sha256:
   C2dkOgWmFYlB7DrxEb+dT/C3MZTqQXDavUK97YkWSOM=:
   742mOPBZLFtVC0LITLPr861YojQnsN6N3awONH3cbL0=,
  sha512:
   D6ajn2tPHGQua3N9E4EB/jmm5qvjnMKfW0N0zFrpK2TcEq2WvY8U79NrsPFGV1XZ5WSj2HbmoFepFGz9WPNIgA==:
   OaBr+ZIc9tTYuvXi4vq1yG22aYOxR/V/sCogakk/pM7HVqLjdG4nfnBrci3JzkQmTEybLn/RYy4YzCzY/otUCA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795687975; x=1796292775; i=markus.elfring@web.de;
	bh=742mOPBZLFtVC0LITLPr861YojQnsN6N3awONH3cbL0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bP1VDU65JeOnKZZR5+fd6JWY9mdqGFwFwJHgOhybjtRv+2mqubo3kuayU4VBiBeX
	 +a708NjESPuqOwak5REejTywm4Dn9Hk8IK3OCQ6+WFzXuz0dLxZ1ETYjx2SIycoFp
	 JyFIwURy2QvN2JBJ0efg38O/qGVQAZqZht9o/4sbamhWVRNBQLrGBG6to92cg2Po5
	 UYlY81fgso72bf7B9m9UGSshvgW/k3FM2athUrXUc6O+nluzqp3sFwEj9YGutFUnb
	 j4R37iFOtgFNAl/VWEvBiE4FFAIIzAWRnK074gEgRC9mC0TGWgcRviEqZ7tSF6EsO
	 Q8RowyqF9a/8hm0mhQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MIL4Y-1xkrwJ11LY-00A3g5; Thu, 26
 Nov 2026 11:12:55 +0100
Message-ID: <9b75515f-f6e9-4d00-81d7-1e83cddd14e8@web.de>
Date: Thu, 26 Nov 2026 11:12:52 +0100
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Cong Nguyen <congnt264@gmail.com>, linux-leds@vger.kernel.org,
 ChiYuan Huang <cy_huang@richtek.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20261125130318.2590336-1-congnt264@gmail.com>
Subject: Re: [PATCH] leds: rt4505: Put the child node reference
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20261125130318.2590336-1-congnt264@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AVj8qIZiHrHRytyKbsatYyeNsZPQpJeNYPtO044jIB4QQodwTd0
 OcnVSOAEWI1KIYX/RNo+DrvRaJGGhTxAg+ZASpgj6rDWw95H0tNUE6+F4Ska94gA+EDVmsd
 amG9SJnBT1Ezpm9vzlj0Sk4GDIjCUgT1D4ub22s+caw5YCazc0jpwHb+kW7hsPwVhfztOeU
 qdTVTuR4hmV/lyT9Alvsg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gZ3KMOcGx54=;5CDJLSLesI6m3OL9K9bHvvQA9c5
 IO6k98/n+Uq7FI0pgfh5uj0XLpfJ0qY4xgsY1mfHiFxMHY3PiTgx89giwzF5oCvhwOQCT7iFx
 ETp/LiMwru8tngiRMWJqR6341TFeUNpSqcoiumprJ/hCz3QjAq1xWpXbptLPb4jcsE76JeePH
 8DUgBTaEVzpR8lVoC4uN4ncO0Y2kMIueh0KxEnev7CdIeNp3V0qonO6RJY2UNspMm1C9ehjNq
 KfnITTGvLHM2Xmf/q/6BKUWIrUguPE7fOUOLeIfk1ePpPl6Fa705Ukf3U+PeESTCt1I0MtG3b
 ym2vup8+ieqMpXwNZBFks1bDwlPddiwlograIJ3cUmXUmPDGtFmQF757dR+cqrtZgi7EXGSuw
 2amHeow7aqVbsUsGIz0ofZi32E0k+WyVh8ZzLIxEqzc18BqE8MgBcDYp/JxmtZQ8WH9wYFXP6
 wdDJwKOlNeMQfLvKOoQiHTKCIkzRLkUEoMfNZDACWbCW3wYsTnF7hWWdWwOtKV2VBS86xQ+gg
 39hXLsKHFk//h/29TspiDzrK4hqJqfG38kd4iDg4VCggVNymfRPDLXFcoiM7rGLELnuTzlM8B
 3KdtI6P03LmyQLueRosel2IM7UQ6o4BheoKD0WyDU0j2TPT8B5+f31IBti2+krmID77LiFcam
 a1dMgr92nChbOUrxwinIiM4mFrm3L1hREv1KkA/35VMx5Vezkq9swsrTS+AxDT50tROpxtp0K
 OTXGSw3C/xBQchiDKqwS3un6No4LunfKn9MrhUvjIU+6O2Sn6uR7A21e+PqcZZrRxBljlRrNs
 EnLjp161jSqnYqoosiwIErCetR4J3gxjTD5MjbiEkyP2EwNm1W3tiNkTTViq+u4+3t+YXiQMG
 FpzkbQOfHShIe4ioxcoSe1nsMdDks9TveK8tzVs/aA4PVShWmP9fyjbBbxu4FDq36nvnL7nXS
 1ZAGboFrQnirOKZpeRHDi8e5ofMRfpySdKysiVmtDVopx/rpYlGdiqLVVFAsAhQ0jOh78ICwS
 CzO0umgUnSsXPMg7TQY8aKXvP/hn0+gNUhXz8gXdkGUL8gF/wTNYvzaOsBpXHQkxC4TEJ2ihm
 MBLf1qA7EL3Bhivb9evVPbiJTEAwXd/yHhLvyve38aWbpcBpPvG0SlKboJbpnEDMderGwQijf
 TTemk8CqOjSoFAqH4E83I5fQxL8uuAxVIXyq65siIiD8aYzIMF6EZHmjBzKBIovzQ+qJtki2Q
 b/GcrSk3D5zYMJLs6xT8dbJu7VvIuYgyRixZiAVc1ElnigavBaROjwAfvnUeCAWmhvNFM7XeS
 eg2aPMi6PnaDQiQaCBCaj/ysFVQ+GPS1an+3CyeELSRqS1AM87xTlC/3EmJTcIYtF4mN+/lEF
 47VOtXUBmikLzRTWujI+CO+W9pQ9rMYPLbj9D+2I/Grfx+gNW+OBB4C+nHlIGCHrc+bc/ZiFG
 IjTL3D8oWWBpHa74nTcPIExPd+N65VpDf3vC2MiZ2ftlidA5BJAepq0gkPpM3eQPVbqjXjjal
 WEkAMX+HX6at1kgMrgqeiFaamkRxbfBVfc8QMs8boHC6QlqQEtYXov07VTB8EjRC4xrQBTd7E
 R8/LNRSZV+OebzUiQJyIIxFrPgICzN+uQ9vUUWz8qQElva6EDeGRVqzno4IXqy0DChQuVvBtF
 Zpnn357wkD1TSNTxO+cuKFqb478JVfJKYBKTDwmSCE6/1eErajDqXTYako0ivM9kx2/AT+r2y
 puqaCPiNqxFcF2jukIXGWsexfyElM67XPyRueGYofpoK9vPh5dRC9ud7+vNHg6Ab+CoSOl+LM
 7GWLNKnHvXieBuk8lVniVjygD0f3D15oZSceiIJ01L3OGRWADWEXvkumH1ekEyHXfccR8s8WK
 yaubvq/6sHUwGc4cgqEMztifgBCjoj3QIopv6UpIMKNnJ5eRoJHW1nmk+1lyPWhEXbGsRAPHx
 HSnfoF3IDGyI/FzZei2jdwVSzuh9D/OXw3YMlOqrqA2fm25AfF2mqvh/oOl3egFKU0402a/ps
 RK1YdbpVclRqOEOIDRTQwSo+T8YSVlsgixxVtn1dT5qi56O86jk2AAQuNYXABZSsSQ3ppBqye
 /6ZfQNOSZ+U4GzFxmo9iaJ9VBC/yNQkHWMCmiIYG2MS79LIVTC2W4Sifl+aVYrkZEfTwl3hrW
 fc6eFdaIDeS4Cturrl6Wqny5J6uLF5awoPcme6pYCJjJULveMkJFA8RMyn5KZ5XXLn+8yGr0s
 Acwd+2Dz7xnCvFE1qoXyhxh5EJX4arhE5b2qQQiwVSzDFLAM8k2h+PGucd/smpDmOG6l7Jx/Z
 FcE6V6+Gna8CjqYbxorjL8EJ4vO5LraOsCrlPshjvlSM4iEJVkJwFTMQLEb71pk3wpFY96iNO
 NrHkubayab1XklHTEe57JGtHaSmB3lmc7yCJwDnjFdJfmn9RUMNxeLS/mDFQ7ZoreEz4dEIsz
 rACDKgQ0nAqRMTehMSoIfAOnCXtoGa2UaIBunvtk/g987fyYDuF9HEXRnLyq9Ow3ELTqA6Dzu
 6MKo+frtlxdCfo4quz5CZT1yjOrX7g4EMX2d12JBasV8p7zkn3sLEbJHeKAn51Mq9QhHiTaPr
 8oFmeDOtQrTg6EfnsJQ8uBdZDFH6OeCq6xmnNL//OGmxcDlCNLbbqQzzIzTlo+gVddw0btqOZ
 BAvJY+rVi4xBHuwAj9O4AyEpWZ9Gk0XyCKsi/0HRZV3OoC97NduDRW+xSugJJrka3jnBzEkvC
 Zl17lH7QapquEB2qc5WZ7XXcnYu35YvCxTm2SVPlqXQ1Uu1r8Qw0lKHnRqQVAIJPz4Zg66jDD
 vrTlAPC71HnXNRIduGdj+xOsSuEazdLWv3yjz3d8OFD7Y+zwkcr7rHnxOy1agCnK7qiPZGjea
 AcINbyJGLohs4IVX8ia+9xWW96d9/DuSr6jQUdxSUux4kXhN/OhqUjklEkp2qLWq8HkZVYHRS
 G4DpJ9JmVLUOdRSfJVf4Z5a/1f1gSblDAO8LX4uTRAHgsb5WfyZ5rLd3xz5WRye3UMhK277OI
 J4gb1g8NdE8cZONS970YzlxS/Ju5bMyEi1LXQkHAXH4tuRNiz8R8HVtCQoNmUuAGeT7Rrh85Y
 7/e20+kIHav9HbNzsUjXSRspIb7ZL32a79L5TreYhOnsWreoCMhWiY+m5I11DFt4RxtR59QGa
 GqrTcTLuCzMmTlvT1YQic7WoBrQnohlOwJ/M4ECNhn0YWSYjiIE400YqzExEXZWiwuwijYDfQ
 fSb9SSPeeC8s8B6zLf3dg7G+vq9Mi+Zo9fpfadWrqw0mCAgHK+2uP+wyXLWRK80x+6yoWVO84
 +ihSp6A1aAGBxJkwbMMouWF8GChs4h+IefKGNzlNQToMZPlFInxeZM1BtIpTXJoTpu6dR1Jss
 taVkNXuvcKjpGtXv+XVSwZKqy82wicalwZo6j5cEdJ2SR3yxtQXC5w7dCz74Z2lfvEekaQbME
 sBX/G+pxe3eUKCQo768chpLGOnNZkdRtl4kSjYF4l2z1df2Cy6RrIo5mPjoIdhkBRwY9wBkki
 k8mdm5al2LlFJZebGv/iF91JcM+GljhGGURIp+s4FqM9j3ciAyPcd2tLruKVcsgJLrKNMBWMY
 BK1VmftIyMvWBeGYiIEQn7oUWgd67opGp5qz8cDlRV+lUrRX/a3swHF3JVlYnDLQora6J3t4c
 5NY5THiIn5qkCxbcMV5xauZivaV1JzgrOf9e+xfBOIO8TuFXHuJyJf2PjLG0+3Y3SIUJ5cK7W
 O+vjCrkfHHTFWpuad0tZv/g5ICQV90hNBFGJBAelclZo0xRQH1dCmans5j1senwPxYZHFJQGq
 4YZdKAtJ2P4GmexoFjrUjOgQ2vcg2VjDGGbfDrjGgrmHt1dIWAk3GBOCITL2WTlIHNmRsXaz9
 OFtvyJ3vRmDk2bzHdGEhSl0pEzFwE1+ZXji+q718iVRM6k1qhbPUw7ARsw+C6mOFHwl16t77M
 QSAe77U9VlZ4heCYFkgb65N936qHt1fnt8F3rLt+uN9vMyPpz8WbuGT/EOjvwdaxspKaRq6LL
 BagrB4N9glvMq1NV5L18GAmKs2u7qXk5C9GoPcEZjWVmcDJjnGoH2kRJs/hNhqiqVUYupDms4
 spk2QGOsAtLQfz44qE7LhmJxWkPM/8sKM/OUHquaIQ0bxwnF+FD9A1b3avPktTJGW9wkNzZob
 UFs+rsUGWav63Vlnc4n89iGVy3C2an2s+AeM7BHbQ6OU3U9GyQVDK9rSW+lW7bsvlYnJ8ilSr
 2Fn0NOYVqyr9vYcYR3OR79tEct6/Gb01wjkN2HTV3XulucFLF7RoPUeKyokWazX9xSA+Z/x0y
 MzqZ3JDP7zjqnEqgpo2GjF487yLBeTiy1shXSBcdk2LAAygowipUFF0HbKN8uPBi9laYcwOsq
 3efITeQatc2wvApceOA746AonovY8XRVbL6NbyYLmQuAlDPUzBqCU0qJenR94G78ZbKgg5Zax
 PDH9i9YbPfS/8daaqTu8q6RUnVm6pFKE5+gomayn4H7PwYUejZP9FFiQRNPT7e5OpbGUeKXq0
 +fl6wGB+w/QwlhGuTh45SQkogNwbaO9NL/jjkSr9hDpVTsLudCAgVHGEVIOil45/Xhx/Mo9Rg
 htrcJvvcAGfKxO5nISO5Np7c+hjpw8B6skkQKn4c5s611tMlEc2iVCTK680u/tRc78oe4z1Og
 WZI++SG3XJGhN+7SQ8aBDyGQh2Gyd7L5mTQwgJwOqKj1yomAhk7V6qFNRTm7tuCIVsjZ5NAeX
 0IMDXe2Y1eX3dj+ZhBVUyyuVgxiyunuPFMuA3YSgpnhPwl3xb5oR5xEpb+6osEv4afT3aNc9V
 hq/lbi0xBSI8Sx0g4xU/swEVM+9RWYlR6XvNFb6g8UeWg7f7x6ZoNSdk7k7NpGUA0HeUCclpd
 jO59qCvab7Ddkwy1WlwWzSJgG3cggMr+zWlfDZLMj8z3G1dWp0Nq7wD6bWSlDRpKppbGD081D
 Gbsjtf5LDPQG+mDwYBpIztZHZtEV9G7G+jmJlR9SbBKrz37kR6WmEI/aFNEbhMysO9dxhBQYX
 DMXo7+Svdjf2W9dF8tChrStyLKhyGNtTNyxJWGYIBfwdgsrZVC1Rrzi009hUoK0jUbaGaN/yC
 x8ziVWPCYKI7O47L7x8AYXseSGEhHecNIMvMZhsWmdeTSJkYff0BqOuwd8GtMY47Fowf3bGUD
 UWHqKn/X6RwLHVnEuKxqzvuAkssmTSc36yMKcyMHp17zC3hbNXDbXJq773uM1XBbeKUCacAF/
 GQlQAB4Ct+NMlDV8zmVVa9tawVLau4wHQ4xMoslUMNNCfytOOVqfP1a2K/Ot0qBCMbivZ6ALp
 UEAWGoZT0fV4vZld08dZJ9U2KOqmdMsMfm9LzR82A/LAYbDey035OsI8qcJuX0vqMbj2ePNIi
 s/N8WWQlvLgQ70pdkoSrnmqq1HK4yNmnQMW3cQqYBiXzDt08x53DJneZDP00592TS+8C8ioCW
 9NuhMzdZ3nHzcezzu+SCO33SEGnGiucsuAlKXHPKe7b7RgkTT0zthoF7dmF8t/KMIDzxfuBKc
 2nlwG31kx/FyiSkeR+G7aQiWXI7tYP11pNEhWrKI8pH3StxV7oOw+AN4nBNM8knYV1MvTrCP4
 Q9fQe86iHkKRCwYenFdttKMHYnxjr2RGW7v5LqvxFZ8Y1G4TPeifnJ9dldQ0+wdo+eVW5dZw6
 l7B6VZsQ6Vhanvfcvw7nMAR47rBRYx2cpdPC8A2sW5siGmG0oG+DIMjEJXF1DE9YjwMwMguMQ
 nXRQ1W53MUsnLqw9gvx1CKmNFCydnzLooHbpRCEALoY5YRe0Y7yGAYOFg64WoszvLGx4Sf4F+
 hXyIqicPvz7Oh0g5PT6zKpVhcA4zzuYPfRm967cI/EJplHhODpLm/I2zqc1tgdCibiem0pZA5
 4QSlzpZvrJ7TcAAFQP9vQxukMLlCeL13rVX70frKrVNOGgRuXZ9PsDZqRnOMQ0ucWMjONkKzH
 pAG/cUjbPd7X5rswLQAyoe15K+uex8iZ0yqd+A0WDsVx2qpn5WY6kdJOidREgeqO/Ir7jfs2/
 5apd9LSkU9nh0R3qqE7i0GZol5tLEPFW2QnpjfVtC0S3MEa70RlrUfwu5vPCLC9HszG6bGiwV
 psLnY95nJZksoa8NIZxUeNRkPxrtjPWaT0hACr1tbfmaDEL0pO/za4KhLJ/LbDsiqo51eI8Hf
 DjneoZgXe46e7ZvjKq87d7AAwk9tFR2sqvlBnUqCdKL2FjZh8SLV+BoIKE2ttAUIw0AignSe6
 5GaN5Yt1Vxoi94tHkId42OU4TrP5RqV3/UAUclZUZFErV8tXa31oA2r7IulSnXr4ultcyirm6
 WmAcMuH0TSzaLu3JpfIIGx9CtP2pQFqtNVYnaVKVuOTsOm4Vvo5cbGGUR/nyAY3VLrVZlXItQ
 AedsGJ7KIubhKUJWfjWbAtVCzlY8VjOZmeKxt5GEAQ3CCb7K70SD/xNnTNLf4xTDBMfKzj2xy
 F/uTpM6mpd7/OOdcPMNB1uXvkfHru2gwX89uok484FP5yL+vY/LP6Uq8zyBAmjoRD3/z6HiEu
 UE76uwqzL9VuJIJobBT3EVaCkAOtUvzTO1axlSivf8M6joZbw1L0PRFvpiLZ49dO20kIoQR7W
 25AwcoFNyf0kQPNjPPIADxe54b4b2MN5zOQkYQ5QQbbrGIupLLp0Nw1/HgKTAxSWUjjwFzYVC
 eQQEL2tVs82cana+DcH75mTAomGjpo09oGWEsBSm5QdR1XWzQPS3LgoUiSKbJMQM5P4GdlgNy
 QMzR8qHgt7Xu2VjK6rIsqdYaygaa8zmDGMmW6ZeAj2AjYS765kH1HPzgl6y56hZT6Qb0NoLT0
 4nRZCx6G28wfWD8EErOC+h77Sr8q9jTWDX+iF7s2SZtxYAaAoTf7YeHNruEcJwJCv6zLvDJpM
 bDPcAmmRBtCBTPKCFH40Lo4DXRRD2gimlTD5FiZYRKs+y+oOp7rFrY/aAzCOkUpgSNgk2BlVw
 5lbaCGlVmMZtCXjvCRYxNh3U3EIVaY3aZX/DT1EhkhjaTY7Yjh5pUrekZEM01Jj2I0fdvcfex
 587Atys3awT3yY6fpQWV7lW8eCMLkuygtC3LS8ROZbFszQTEq3C5ePIqKW3KPHPkUSdZ82eC5
 RpNkORRPL4d2A09demjNbu8J/EMEr7BNrsK0YGghb5l4TB1133oe4xAtW1L0+7ob+iLfyLHYh
 iwG/dA+a1ITLbA4drTIx0Mvq/LI+Rap6fDvIlssygUeaPaMQP2yw590tEwgsQvt09BNJUtqpa
 Gz8AIzZUrdqYI5K9tb2kZG3PElc0NtEiU7gGlVRGBBJhHpu2UJZMR7U0Wc4laBJMH5oPdOHz2
 MdDU19HbhxhYlRLX4+8u3NiJakVseJQ7LQa+jDumQsjssJtSYsxydtbYus=

=E2=80=A6
> Drop the reference with a device managed action registered right after t=
he
> node is taken, so it is released after the LED class device that was
> registered later has been unregistered. leds-rt8515 puts the node of the

Would the identifier =E2=80=9Crt4505=E2=80=9D matter more here?


> same kind after registering its LED and flash sub-device.


Regards,
Markus
