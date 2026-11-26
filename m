Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700847;
	b=kn7uhbfPpPHfc03SdYAFPhXGQdcT3vQWlTO4wHQtpQou7rnYhQ6LNrOUbDCfC/NCsfvX
	 98rgjn6fEdCxr1eStrOM1R2d6lt4vXKLbUWoj2iBtUDR46OCFsTGWxUCkXkXj7AiMhZGY
	 R7xexmB/msjt8hxIrv0uSOPwGsDd9c0h7vp/vLsaRjRqL+IVowLlvuHcS1f1ebX9uoiQj
	 7wXMTjlxhrDUpT3VDSbR7VgEU8WVUNr1f6pFix9L6IrYYSyDFj4tX6/70u4unrZS07blr
	 DC7HvZJ+D2iD1+Tz3Qlfi2zfK0fG9Pkph/k9AQc/DZi0bF+GvgqJOY41gIKTVbhUyxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700847;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Subject:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=LXaikuDoXZ/wEpNGlm+18PL/1Uu87SkuXiWFI1fyLws=;
	b=Dr95uWofSN7E+xOPshZcu8hr+u5pEXOA61/K7yGJrZL5kWIe/ifoxf+XgR/oMjOVvebQ
	 HeEpcQzz/RU2vHTCjnTVJzCaALHjssQqvrbTvMwwrRZQVe1lRFy1BFfK17jcp3yJlvivK
	 MA4xEYDYShkdS2mAaRqS4lmKv5MFB1zzcU5Sxkq+G9l01tVVWuqxShzPC2+qGhOKEEIKE
	 XsbB9mNOTZZGADfTh6frGQELb7BS71+YLWRzhCKmXFnnvBbXFuXlqur3bvBmroU7f0tpS
	 V/AO9MN3BNjCd7ALwikwK7+9L3yCxMaW6fiHj5AIasukpy+Mxm06xxvEr0jTJJ9cIPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=MYlSnGqc;
	arc=none smtp.remote-ip=212.227.17.12
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B61606A329
	for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2026 13:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58B61606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=MYlSnGqc
DKIM2-Signature:  i=1; m=1; t=1795700844;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
 d=web.de;
 s=s29768273:rsa-sha256:SxWMTtoDOknLS2uIvQ9J10oz9JjZ
   ZzAzbRK+ci0L3ulRMtHw4gOa1o5Ax8yw1MrejN0oNhkXJcxH1wS3zgZvhachAO2yFqVWyY4jf2h
   j196cvMKVJLQn//fa1fM3seL7LW/Qzvqd70R+eeQp1oDJ+vFQH6YNpyzHWqVtbQ9VJRnrb8KM5J
   /RH5JcXdVUdt0/envtBEpTABN3/pP/1A0Qp34DEscygmKrVojgVoN8md5GgASSUPiBXRsP2oqC8
   MlfE+crKRjp70xCwuM1ghLnwWgreNaHEEB5ZFDyErR2v8/MjGY30LEISnszscfkNKtS+/9TM6DB
   KLasdSYWk3tHAw==;
Message-Instance:  m=1;
 h=sha256:
   jRYJOm6EkEyOwZtcyZfVcTDzRUM45p5hlQnCW0qBB6c=:
   VPf2ONQA+NWJ4uc0KehKd5COJgPePc0R8Fs1VvTXBuQ=,
  sha512:
   ofMSPChv4ybmfaUg+t7I7tPZtqeVyxVUaRybqy7thP9H2xaW0kIAoo1wRvKu8lR/7iDzXhlBYoVD8/MkZG0Vtg==:
   QL208CYl+g2rUa6HvVLX10vMT2xL/PYpcIlJ6uABdTPaE5KgddsgnRmc2WNapkGi5Ya1LgstH4j530/7Pg622g==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795700818; x=1796305618; i=markus.elfring@web.de;
	bh=LXaikuDoXZ/wEpNGlm+18PL/1Uu87SkuXiWFI1fyLws=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=MYlSnGqcMXj+FPCVlUkDYxgyh4B0OC6MYm8oWpHJSPydU/I60TV96L/Eg36WvxzK
	 q5z14JsopfqgTw4syfwKbTQ24/d0i4KSluKqZI7pjDOiVcpRdaK9dQpKzGpM4En+F
	 UbgF1CxXVSAZpeBCIrXOCicL8b7M/ZbGB5hMsRWJtMA3N+32lpoFwvjzsz7uKDW2q
	 6b59g031kyoriwQkAx6jfA/6j3AjGMf4TLnXVbQ3pHNcfaSIX1SawE8PtRJPygBrr
	 LnZ9YjnmhUGs8eUFx3vuDbea4m/rv1dcPDB+kZNg6O15hjPZI+GBKIAdZIbJ/wB0v
	 PrHGM1LAlFtZm5GtRg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MC0LH-1xeVuZ0BnZ-00GvJk; Thu, 26
 Nov 2026 14:46:58 +0100
Message-ID: <f92d05d9-2452-4187-bcf2-872eb285077f@web.de>
Date: Thu, 26 Nov 2026 14:46:56 +0100
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
To: =?UTF-8?B?Tmd1eeG7hW4gQ8O0bmc=?= <congnt264@gmail.com>,
 linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Luca Weiss <luca@lucaweiss.eu>
References: <20261126122516.1198461-1-congnt264@gmail.com>
Subject: Re: [PATCH v2] leds: sgm3140: Put the child node reference on success
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20261126122516.1198461-1-congnt264@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/hg2e80mywHl9X4fYb6ff90TyzEyQUueQPBzAIuOX/nTtDvNzlp
 ca+mtsHahgz2QBceBnpnclO1SgUcCoB1vRLkShD/o+HzMBKi53qUWzwPiV3YWaquf6JPErZ
 usNyvEOuyQCYjSeeAz5cQqWfJSoTXivUjyqKlqzsAY++OGqMzFb1+3eqowokwzJYD6dIqXN
 7+RZgash5Ej2Xj1FkVm2A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0mRWrngfURA=;CKYWP0VyCZMO+kYJbfU0PqA4i0o
 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
 ByxH1b4vFn7fiVmpt5KoJpYmLAAicy0=

=E2=80=A6
> +++ b/drivers/leds/flash/leds-sgm3140.c
=E2=80=A6
> @@ -270,12 +270,10 @@ static int sgm3140_probe(struct platform_device *p=
dev)
>  					   &v4l2_sd_cfg);
>  	if (IS_ERR(priv->v4l2_flash)) {
>  		ret =3D PTR_ERR(priv->v4l2_flash);
> -		goto err;
> +		goto out_put_node;

Is such a jump to an immediately following statement redundant?


>  	}
> =20
> -	return ret;
> -
> -err:
> +out_put_node:
>  	fwnode_handle_put(child_node);
>  	return ret;
>  }

Under which circumstances would you become interested to apply the attribu=
te =E2=80=9C__free(fwnode_handle)=E2=80=9D?
https://elixir.bootlin.com/linux/v7.4-rc1/source/include/linux/property.h#=
L229

Regards,
Markus
