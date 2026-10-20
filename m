Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792529984;
	b=47j9DiCCjQQOZTgsycgyLtdJDY9Ymq0Mv6b/x7a3fjKVB5+Qc6mhXRF4ZI6REAzl6tlZ
	 rGYZS6HvNbEh66cnPWyH/I7Cun1go4FucY1rLLTyeTJYcMH00fTcmefJhMzVWw0mW5VMO
	 qkNcKaEbkoG8rTlKqXxjcCwhRZqpXe583vw/eh+6c1qTR6hBWLgxWCg1wEOtRlnMJoKG0
	 lmRj6G8HFy297pOR4lfTp3pbZZ0kQNmTPJg5eXpumHKKqCosRfbWH0ib+INY9GPvxhD52
	 uUozHpo2GGUFojXvTeVGB2oTWkYotDZq4J0KzCP7pzkOXLU5jVhpgIbzGKVWSbA7y6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529984;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=aHL6XdJfEOKyhQKVZfVw4BPkgKX5KK8BAOSsTuyLXeQ=;
	b=ZFpL7i+FlP8kYL28qsmOMiKLiS84pHaH9lwU6iMcpEBl1Kgugq5PzbFh5RoO4fRbbYBU
	 hO9vhK4r455OKVAztNVVzxY0ZXFNX0FR+O95uveKl/NSKJvyfEeFOJZam2H9N7ujoHJoo
	 7iwKCUTu4QgB1kaQZneNnzsh5OOujxkbhe6JUbNen7aU7Hkj3kQ4CVqmDzPWGc38gHNy2
	 QTQUuZ30UaTT87ZoT4qddzlrpHSNtuufgeiMX2MSI27euVzrtwrABkjhTpujJhqho6P5L
	 HDLlPHjRjOk+uBOeFq7iALblwzGwLGbZTi9SPy/Rdq6GoPxiEmqz7htZsXIa0YRVzPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=DxArZPqR;
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D090D606A32F;
	Tue, 20 Oct 2026 20:59:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D090D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=DxArZPqR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1792529981; x=1793134781; i=w_armin@gmx.de;
	bh=aHL6XdJfEOKyhQKVZfVw4BPkgKX5KK8BAOSsTuyLXeQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=DxArZPqRCKFataor+OTxAnCj4BXyllGTuKFihQBLRSbNH85P7O6zz8CgIrx4h2I9
	 cmGTXtsitPD8xzeW9dnsES3nDZW8tCFBb3Tmyu47OuMEOR5I/S3bL2G0pS8dnAKRR
	 xBc3zzLqkEb0JsbNPWSQaqImqygSAKTi6e4rQkoStzmAm6AuRS11rmbt71T6J9yR5
	 I/3larD6xKXmY+UWkOuUCb6gYzyu3Ik5F+yEwA9hMyL06GtA7h0HsXLK0nUi5Pllw
	 MGyUp/JuEZtF2f+pV7r4JOZVcUpXoiCJ3/uHLlJso9+XX9ji2MDBmC51gW+qAibXj
	 cdpSPG0634eCO3wXBg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N0X8o-1wMkUT2Ptk-015CVk; Tue, 20
 Oct 2026 22:59:41 +0200
Message-ID: <76f70649-1953-4e58-a194-347a215f85f5@gmx.de>
Date: Tue, 20 Oct 2026 22:59:40 +0200
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
Subject: Re: [PATCH 10/10] leds: multicolor: Adjust maximum subled intensity
 during initialization
To: Rong Zhang <i@rong.moe>, lee@kernel.org, pavel@kernel.org
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261018135339.1109271-1-W_Armin@gmx.de>
 <20261018135339.1109271-11-W_Armin@gmx.de>
 <9a13ff3a5d799a50cc1353b94af9be6c70d87f47.camel@rong.moe>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <9a13ff3a5d799a50cc1353b94af9be6c70d87f47.camel@rong.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Hg2pSA07LlL6TcIPWhemMaMQRRbu9psPNalVJlT4ZgsTu7CmOMZ
 +aMskohDLi45k9XoEh8Yha0+uufDqfiIYe9HBuLGj5McUK56aIrHLZG/1+el1d0XuxIgE6j
 KHNGV3WDz1987vX2LMKiaj2vM+hwDLT4qVV140TwbrYFMkrjSvXDiNiFC2KAIJ1Xu2W/i1h
 lBpWhyakm0cUTc+auFPeg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DNJaB5S6r8M=;v+R+SA+8xRItTIPVakrqWIjE64z
 ZapGAWiPIgJE8CRGnUN1ElByki+bPC4YbF6oH/5gabto7VJR1LH8nXZTQW68qL46SnwxKczBm
 2s9OJihGpiPbOPhebwAmnzFuHYjWEPU9ypBDXwt1gSrrP//D/Vhvtg1W6qyQgROtAK9SMgf86
 uJQUs68Ee8SL/ULb9bUELyVcHTgPnJr4y/5TwJL/CeoCxSA1kSq09wOQ1nlh37nSP2yGJQe84
 vo+hq1EjBd7W9iOWPkkbpFaTEkC1g09pHEwMc+4haJoI1i60lthjEz1UB6d01jjCz7t1twF7+
 PgS6Xurf60l+IASrmzix9LmI1AYkshSBqNZwgVdCYU69COBHQqL1fUFW+Es+d01ZBnz8MoQZ7
 Ab+raBz6he1FjPwmeVW7iYMU6oSg7z5vovmY8qUVAJEVv5eHhofBDt8UJYYNMh2fDyuVB1aRJ
 K8nFInpm1Juph6d04M002Z5wD7Kl/13/GN4dMsDEd2DhTTchHp5iuzMEMl7QvcssFPw4+9FVi
 grpupLCDi0AtE5ob5aJrl1UCE2h+7X/BFpGJyZj2ojQBWWFhcPaQdjNIDOYvLLlwky5nPdWnT
 sN6VdwX2wyKvjK5mA/slg7WnUtyWO4+gEpz9H/W6nwTPcYmgRlBQ1rECY5ypppfvrm2BrJPgj
 7N1kQ38um0XLYL8JonocV+OuksAsbm2wsCvXgHua9NYWqQovrQ/G50ooW1NJW6CHzlb/rN6JF
 TqzPD634750nwz/wFTtzGNVoM4vmJj6V91sPCMgOExmWTXHKOEuYT/6VAMu1dWV+/BEhmZuwy
 CNldy/y1ThjtTWIK5xdhHRPXk/F+45zNu6vy9XDhpizhlETZ25jheN8JnOTaizCxIE2HIX9Nm
 gct4+Jal6VrwAzVzZRPYbO8GUreKP5Mk4en9j02YTLlmMX7EtGh4LOYLCkhkJfXnq6y1efI/9
 rkUdowtoYQPF9CBMRW2UFmw7cyc/F3nkYiCA/nbJzni2jorpYpkhjHxFyWhvgX1qi+jlp/YWX
 yfe6o/NZeWFSjVDKnPpjl+ugXGGP9hWSP/gRutQU3o/mvNBJBW/g+S+n7v2PAQ1zcPFqBS5+z
 03igO61fDmhvShK5532BuQB5ArxNGMj+d4/S0pJVpAqmsfgoFcQ5CMSeWURXww+FeKqy5mWir
 qx8nomhK9B/Of3zOzgXTV3eJIgUYjBhLGyf9LFz5bg2Xdausujmt+xtnFuD2uG+iaN/BLTMCg
 yhbaGWrS3iGeUlecfH1tuAMYW9uxVNRg9pF1PyKRox0imYDSGJUGQNFk+3VBAnZzQCWmT7cWw
 GppDnNLGRxFsKrsRRUSsq4Hd3Sj8G1att/kLxZ0EDTnO2/zKO35a3g6FACe1LY9GZUZZSVIJG
 V1ClnBvn6SVdCbBdw4/JGvAzrI3UvLbmgDlQqpllceXhN96r0BfMGqG6RzGy5pfqX1NfNql25
 7ODyd2G0yVVwDfrjQgjpFVFCuf/8X/uJu0EGzEg9s6tlqZBXpZ8VuVPFV1ojqgVowRexQwMFj
 UTkR3/cY/nTB/ZmH+PrzgQkZqoXBiLBoQB5YIBbL9i0SyUtbmzIOPDzclzaP/GG5d3IAiYJiG
 RIhdax6S8jpiR//21cqwBPEGSUW0MD9IVycl+tzpQRONaxCqgcPTJ/TkQIe8D1mXbMIp9YNKl
 LLux0DYY35HN4pnd/9yL9URjUCkRXwaK+7Ik132hHCRpOUrCOPsJBmvRhNyfSknXPQjhkRDq8
 GjKxrUUrKyQ/c9FRzbIR12l8iAFpcT+V+GnV7TRE+ni0CwejH3jjRstI+X0nTvHRBC1d+S0yP
 fMt2LdJv0eeee+g5rUaSVjP8d/4HAD1EYCNn2rNNULhn6iJTEVVVjBZ3ShTd9at0xfFSjyt+h
 sBsIHbkYc/aGLLaYCcq1bwYNGdkvqK5uNRozK1OnlPR5IRtkd6GwZPPqOiZJMPXIIoBgFegi7
 R5d4M72UveA4hbglznoiHlpUzzM9w2XTgFC5wCIN/RNMLhfeukFFE7SFtbuDPHgHksKHT0nt1
 2BaWqww3/KxnpiX1sxgJ53NWjv3deNngKzmXkYCio8itDUQ5yezqZ1GClwiBYd8wb3ZE7w9O2
 daPUrFFxduoNeCtCoSXUCryL/Bzr4G5+GU9seYrTDh/d9/XG/+tlsdIYvl7nKPH9hbeBtXQtx
 GjbQ2cDIGTgqJDteJNWTq+bJxrt9908Cn3Xd7/OBt/m/A7BKbDWhFajGJ6babDFWHJr7yKegC
 GbsW+MXeLV1nJ/+lfCdFF2MakaLzv7hbDQeMNc3ggZiCc+AXVgq124abzdB5EtWJluFgh8lDq
 jKy5MkU/wFFtjXtIaVdHvAADSBfY64mFkUWpLVLQRMIsl3V2Ql7Q7TMuKB12R8JY1MKDRfwzR
 2ba2fpbf0EHwdUTPCDrbY93P9jjUSvebmN18KSv1Mg0U/bGy80W1EQI0jyWePn67GzE2Hg6qF
 LWIBGtA0+65V/N/9Ehq2gISXqla2wlrToWFl1xqp4yeuTjjL4Kk2crLd6LgvPU/sy34ciCIMj
 oTxYfJGIVAWYFEPmXlFjKg+nikWfljapNtxhMs3F0D8itdme5yoLK60RLJIVKVfolMlCNPJBo
 4MMEW3FkF78xwM5T4yiIPfJw13NC2TGXJP7ZsQN1RiK55GBvv9Gcmva+Ph3wP0NYG0TK8/gPB
 eVCpstlqL7hW+XfLFPp1CFegITGQojr5qpCa8cuBUIXxX+rqC99jF6VMhldBVU/3JbZ/Ee68X
 nkDirlV/bHKQyKm0jWai2yrT7z/QAqfyqjzkCrYcKsLXxW4tm8+PHz04e0QZ3PC/RbQ9NJCCl
 MLkdG/X9Lds/aI3KnnqW70dGFbKBxcWX37/pzTyBVIMG0VoMaECLy9+QLpISTAAcCm7XgpaNz
 E0rKncAj7mpBkLTgubNOcPwa5y/IJKjTwL7yX6fXNx4vnQY+QQL7eD0wdjU0erWba9RxfRJDt
 c/885d5FDR5SFOHKMhgPWSA02jyAozSwkXzGcIo7xVHtvriP4arWKWzqR/XuCv7AXc7V+GUGB
 Un+m2BAZyWXyJy9AZeDVi6bV+UTdh/+RgJ82Vp5MkT7BJml6V+6KIpv75F3LeSuQgsDDBT9M0
 +NiEMPKgxuusWW6U3Re67m5taBq7F7JJAyKU7Aptyh6UeF1sQa/NCadXNqV26P1OthsAe1CKu
 b98ft6SgUbVl9RrxgUJS2A5Uwejy+qiA0QkmO82FlJM01cq9I4edUfIr/rtmR1sDFGlpvmpQI
 ILH2LvyeFI0T6FXYhuEhTAjdN2yvBtWMddafWzCPTR6D8FnQKKvfAqdm05G6KBzyPxKCmi8z7
 HmkCD/Buw7eVC+UBYKViubhJKZleXMRS1df4Wi2n7ZaAr4Vcp0ilCvKp+DPX10DeMcbaS3gGG
 URGp1oMYsv3exNbs42TLCdg3iRSeg0VtftwxYgwLojCqPKlDJj1NqXlMpTvOZnJXDxGqeV95q
 SkKWDOLNqqY5Y4bUNSD/szYfBuAZV9bQN4TO1sYGGPFEsxoLpFvSCrQQfrj5HMd5aXzw8SMaQ
 XwY4VLWtIEYOTJoVyz60BKYsuF2wIPxgNz8/BqtvfDRFlGnZqxfb9L6sK+v8kbjg++w3ZnEoU
 H5h5/tAH9NOObeAIYPWrt4bGiIn6vF0jaAN8E/uFMrSXZdtuNIDUSMql1cusD9vOP0BgADCKC
 GeUjHysraOrYWEe4EF+dCirmqtff6eKBnGFHVrJrVJXGjlX1ah1b3YcB3my36z10Pfv+F1Zf8
 UchmTVK35mRVYP+Rqlm6x/gs4nJz2PoyN2+XVhzOYFePHJtlfvxNsr5C6RNx36XnJmyMpSbR2
 4BnTwDyfjcVdmNYSbH3AWgDOP7f8CIXgnPJfgJzWlpJReo6vZNFoe97Lw7Facum/BjtK7voBT
 pGJ6Qefodt8O2RlHY+e8LaR8Zeet8vCbjOJOpbGfQWDf7+Xflmqdjq8fJpGyGoPRgQpd2VRKR
 vJuo/ty6oAooPlIQK8l9tHMF7fNWMzbwWywPSlunuZRGGMgJvnMrzhPQHE8F0g3sGxw3DiZY4
 geyHfbrbR0oTYjA/940yVi9xliFbUKZWnz7348iepukxOeD9EL43J5L35/CaJvYgQoZS6Z/o6
 YetWc97pD2fjvzQltW3PoYggk+uf4bPT1fslKN91hgAQs05FTr0uRouwi6gWgUOI9MhAq1+Ch
 fzDXxLrdzLEtPehkfrYuSqXyfBSdN5qANbcte6zuMA9mfZvuBGAN5Q8LkwXJdtXAcQpRlQ7my
 mCF4p3chWsb3YdeS5iyxl6qrNk1Cn8V3j9e8+xD1C51oBh9sTozIQNtew/podcpV78fimS4v8
 2q/0us70zpLDB2SGAhE0IRMILc+WoyQzX3tzPJhTFDZMGQtMTXC1Ventu6vcWGSxMvB/C4fcR
 wIZ28JHvWld1xBNetkU0lH5wzsLScrOdkaGB/Br7LthJ86CRlcEJI+gBuSNniyWm2w1mD6KEW
 hc/05rMygnEMMbBvVgT55WvexcgbqyNNRHxVc1jfE5i3hj9kzSVysNBLE8McR4J8ro0vLBP9I
 N119Wb0TRrsFsjXQKSjhbF0S8tZcwPNuQrGLSQls8CPUtbPPODIpSEGQIaRCqLJFHpr2hcVB9
 Ym1DC6cBo26yqma64UsnEKCGh5lO1Hxw7XJ36CBw22lNQspCkS3EZRtoARi03tb6QXW3tZTaN
 dxGbSq1sACVhQsk7mh6+9vm6wDjPmqBdryx+L9Gxe9u6zze8KO2SBJ4Nx1P0kJ2Al0jgyPhtv
 M4tPJduImNG2N4uimcXMdhEcLiAJghipkYdBzoEvM637BdtTuV3Ytb/jDilWfh8McbCPZxTzR
 eIrjnp8R5xolB2Ufoa05qO/RQBqzCcebEyd8CHg6td8/Gc/i0iJk7ThMf1TXRbEZQxFbjmO4J
 7ykO9XK+odXRhpDh/3RC6cpNTNf2XvMdsDYFqG1fcLF5U0D/Qnb9kxbmYSlQ+H9K+Mnx5OOne
 cV14VMplhxU1MV3ZRF+gvDZradyePcwGLvkVHwzD2waWeCtFS8n61QDTCosTZmvkC8AhzEBgD
 9QFlq+3uT5rnhLPagtlWWiQU4hP1rzY7SMxHMeDZeZapD3073sSDbbMyC6kdC1wlana6+8xkr
 kLq2Q6c552fizRUbbeySqINsnOx9wHj5aJyCLyWNLxUFWwiaYzfGvPzJTQ28OOIQqnnXougqh
 73X0TqvR1e1wPJd2zObpEPh2qtgIemdhvFBFtHKYTwTz/4p7AcwJbUW8wfYp+80rKmEc6ir5V
 RY/+J3rU23T0jdgmbMbunQs/1yS9kM1KKrOB4rIGiwXbD2GL1jCYs5YLXzCD+kmwFiFfdyC+h
 MqPb7xbRk/DEsC2HuzD0+043K7q9m1QltzztwV/VCj76Tia9MErqkxOijM6n0kpp0x2I+G0sV
 cW58jEUAxuIIVqeH/wL21pQx4sUGSt78nT7gPxUVMuZzvkshREyEcXhtthvYspSyivDJgV2Rd
 OC5mFAhDZvplV0MzDqJ1GUDQL0MpTvH/5APVxgLfUbiUoz+V2OmfBiI1n5BqMdBm4cM7GHDUc
 8szc99jEayVySH8HZvs2xu1odSU1d1B2Wwe8OnsBSGcKZpQuyAmy9K6rTH0jK6FrQvEPuiFdf
 m2e679JVRySfCN6XEZShw22gZGwi3kaaZ8JhooiyCG643Pya57+e+pjd/zUihFvgLqEy+1eFj
 YOJUUhCIeGd67QkiF5lheBl1HPnzX4K+/C63g1ByJfKCXFT4ICzyA5YexWMkvCG5KcKqqBi4B
 XQXqA8NGAtI26hn+F1TC8Kqw8cPcVDnWKDE53bpEeVMXFoJnzyuXxzdRh6ATsqZOeYJ6pMrSR
 1pKHYxPY2IZfw/pQIJivhlnZT2jPc++bEOW1mRmwCQjW+5z41jq6TJbRi0eVDsQy5vkRvJkgb
 0Y3xPZ27or8zK8HZk9JuB2shyHW5ZPTbR3Uohhcx8EYtt/CwPZ/C9f797ys6cDX2ByCBoZAJp
 LCnqsuuOYNsLc5w3zfA0Fh24ySFJ8USpFyQqYUATC/mPge6HT9iLOXxPaxeSb9ubED+DK7qSr
 p0S1usldKbNblnoJwLtGStu2DUP/CfIA0kOAF6Yo9K536cFcAI/yUBaAPDmhBykJe0OkPJsG2
 MY+B+bIawYbeP8ego35x2DRhAlmfNr73eAZBVF1SJWJPSXbJMlDzIfMQMHctPj19weT/2Ycxo
 eIkqSigRsptnNCe3RD6zC9HQ6zLINxnsFIVi5Ypkhcm9TpQaWdYPFFmGtsYvjdT9d7gDg2j+o
 ewxSMEeZdLIgmuL3ixRxaXyaPUmQTC6H9ENw+H+rbcN+GxWb0/twpCZuK9UoEdrbKeXpsblaB
 3JL5TMLO+mCbhkm857gMpsQzkL7aljU2KUW42EHstah2PZIUIgidjKlShHlKsLr2fbBfbm/El
 kaBVfi7TU7Z8b9qJfW25nRYGzG13UYF8jEY5fcZBmzGIa6NY1Ok+3m1RSemuU1Vpc7JfuO2Ab
 lg2mAj1+ZaiJJ+qYNfzb0D2rftvm+1PYwtFXSETLupGE1jjbPSTR8oikWWGSCOD+4IvN1QNps
 TUyOcDgRLgpNPxA+HpXgX0Qo35TjtGKD1c4l+V9H+rZ1N53c020XQ9xeyY1skbKSCFVyeJ5oi
 YEv5s9K00Xyk/q7k6hVhqYXQG7ad0uxb6ZRG9qF0/9+xTXwNkcPvPTEo9O+WA0w==

Am 19.10.26 um 13:54 schrieb Rong Zhang:

> Hi Armin,
>
> Nice cleanup!
>
> On Sun, 2026-10-18 at 15:46 +0200, Armin Wolf wrote:
>> The maximum brightness of a LED device is fixed after having called
>> led_classdev_init(), so performing the adjustment during runtime is
>> no longer necessary.
>>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   drivers/leds/led-class-multicolor.c | 40 ++++++++++++----------------=
-
>>   1 file changed, 16 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-cla=
ss-multicolor.c
>> index 9b8c37f7bdf4..875c615c33fc 100644
>> --- a/drivers/leds/led-class-multicolor.c
>> +++ b/drivers/leds/led-class-multicolor.c
>> @@ -14,24 +14,6 @@
>>   #include <linux/uaccess.h>
>>   #include "leds.h"
>>  =20
>> -static unsigned int led_mc_get_max_intensity(struct led_classdev_mc *m=
cled_cdev, size_t index)
>> -{
>> -	unsigned int max_intensity;
>> -
>> -	/*
>> -	 * The maximum global brightness value might still be changed by
>> -	 * led_classdev_register_ext() using devicetree properties. This
>> -	 * prevents us from changing subled_info[X].max_intensity when
>> -	 * registering a multicolor LED class device, so we have to do
>> -	 * this during runtime.
>> -	 */
>> -	max_intensity =3D mcled_cdev->subled_info[index].max_intensity;
>> -	if (max_intensity)
>> -		return max_intensity;
>> -
>> -	return mcled_cdev->led_cdev.max_brightness;
>> -}
>> -
>>   int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
>>   				 enum led_brightness brightness)
>>   {
>> @@ -53,12 +35,10 @@ static ssize_t multi_max_intensity_show(struct devi=
ce *dev,
>>   {
>>   	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
>>   	struct led_classdev_mc *mcled_cdev =3D lcdev_to_mccdev(led_cdev);
>> -	unsigned int max_intensity;
>>   	int len =3D 0;
>>  =20
>> -	for (int i =3D 0; i < mcled_cdev->num_colors; i++) {
>> -		max_intensity =3D led_mc_get_max_intensity(mcled_cdev, i);
>> -		len +=3D sysfs_emit_at(buf, len, "%u", max_intensity);
>> +	for (unsigned int i =3D 0; i < mcled_cdev->num_colors; i++) {
>> +		len +=3D sysfs_emit_at(buf, len, "%u", mcled_cdev->subled_info[i].ma=
x_intensity);
>>   		if (i < mcled_cdev->num_colors - 1)
>>   			len +=3D sprintf(buf + len, " ");
>>   	}
>> @@ -98,8 +78,8 @@ static ssize_t multi_intensity_store(struct device *d=
ev,
>>   		goto err_out;
>>   	}
>>  =20
>> -	for (int i =3D 0; i < mcled_cdev->num_colors; i++) {
>> -		max_intensity =3D led_mc_get_max_intensity(mcled_cdev, i);
>> +	for (unsigned int i =3D 0; i < mcled_cdev->num_colors; i++) {
>> +		max_intensity =3D mcled_cdev->subled_info[i].max_intensity;
>>   		mcled_cdev->subled_info[i].intensity =3D min(intensity_value[i], ma=
x_intensity);
>>   	}
>>  =20
>> @@ -187,6 +167,18 @@ int led_classdev_multicolor_register_ext(struct de=
vice *parent,
>>   	if (ret < 0)
>>   		return ret;
>>  =20
>> +	/*
>> +	 * The maximum global brightness value might still be changed by
> s/still be/have been/ ?
>
> Thanks,
> Rong

Good catch, will be fixed in v2.

Thanks,
Armin Wolf

>> +	 * led_classdev_init() using devicetree properties. Because of this
>> +	 * we can only adjust subled_info[X].max_intensity after said functio=
n
>> +	 * was called.
>> +	 */
>> +	for (unsigned int i =3D 0; i < mcled_cdev->num_colors; i++)
>> +	{
>> +		if (!mcled_cdev->subled_info[i].max_intensity)
>> +			mcled_cdev->subled_info[i].max_intensity =3D led_cdev->max_brightne=
ss;
>> +	}
>> +
>>   	led_cdev->dev->type =3D &led_multicolor_device_type;
>>   	ret =3D led_classdev_add(led_cdev);
>>   	if (ret < 0)
