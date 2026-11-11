Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794384251;
	b=WFPmhWMkGLNRswwh27A7m1iML1bEWi5IUWhjrUMoLaUOrMek+l0sReoK4P8OxJGuBJld
	 ZiSvrN9avSwb87AYFmT6ZS5tFp279vwq7Ddh1ZecYI2G45W9/pM15nxQTjgFck78/nKbw
	 BmWND6LxjleWzQNcJpv49rktpHgASkH9tNSoHBgIw0kHsqlTiZR53qr0bckgtb54bkSai
	 LQ9oSdUnX55BzozMGtPzS4RTaLeEbensDbjnOdBuvd9oZLV6n2vENfHDMv7z9+qhkCU0T
	 kTjAfTPqPOD2NoXq5h2cheAJmX5qtgq6n2gD6hIhFRb2jBVEArOUT2WhfFTBIhlnXJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=e02CISDat2rnFU5auy1swbmNQ1NAggjZWxzVKQlZOt0=;
	b=GFSqjJ06QniqWWQlE6/EyojfAk14yvpnbOrbfcUcmZN6QemuQdsup19zaVCWxuazMz87
	 RbX/Zx/Q3E4dGrPA2JTcLN4nwZNbi09Xhby7U7KwPpB+P0n2cluKJvfgy7PD7dmvWauEG
	 emDABDxALWqkE+03OpH+VqHPHbtQZjusT49JyJNaCG0SXdqdubypTPNzAYwmWb8BpcEGH
	 2h31F+QG8nqYXjdLpK/N9vEeKTkbjsIxs7vb+pCkDGuv+9jq0gGvNILOxHLtOAe/iArKm
	 l0ehIg1TufatWjJ3lCNIY2l67H+LkMMnzsOIC6li/0wn9wLYg7MGwY9BWJDaCb16wvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kzpLQfiw;
	arc=fail smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3103606A31C
	for <linux-leds@vger.kernel.org>; Wed, 11 Nov 2026 08:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3103606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kzpLQfiw
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36f8cdd30beso4921624eec.1
        for <linux-leds@vger.kernel.org>; Wed, 11 Nov 2026 00:04:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794384250; cv=none;
        d=google.com; s=arc-20260327;
        b=HVJT1DgTufvuRH+EsTXHqSiUMbY+v6qkPqSvylsYbZPuMAqZt6I6eXPb+Q9rTvpKay
         o214eireh61xu+TvQfF3EgPNSJXeo1An88Z1ReCgl3JzR66lHb33X+6yCCYqSiSaoqf8
         V3m68uuA6nF9P5f+0Jgw+WMXSH92J2eKwgZRBhjbdkGw8591pvsST+adsdB7cxh954vB
         9Q9wn86zTRAFSWkZF0pkzCzS5Na41FbGvxQOobvgp0laExHUO2kmfgTVpoYKMxNLv4tn
         Ps//3iTE0B/awDzXwrDQ4Q79qmJFU3J9gio0yXuD67pEUoEkTmAki3ztVV2j/vAweXOd
         txbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e02CISDat2rnFU5auy1swbmNQ1NAggjZWxzVKQlZOt0=;
        fh=iRZ3IMBhSrpSMMm5iLVU1hKQc8lkni5ljw/WfYFjBSk=;
        b=WZWqDiW4coTDQgEIsK6IQ1gDVusjUlde1ruQsh9picBKXYHrpStQIJTmSs+knKfAe6
         vUGNFtRcVlgMA8m2SoX711YgQ3QoRlpsp5xFvVGvz4iVqwCO0QN68SMa18GudHc178qU
         D1gHq/gN5GKkIsWjeX70VNteydb/o/DKye78yg5UiVbNDTAQSEN2Kx28jhWxAlBUHmgc
         g5uKoL9IGo9BbLFgUqM4OJ/laNA8XYQH0kO7zFrYZ5zH/XzSKREuyuJf1GAwZx1Mvbg6
         I7JlqXJVzVk23W9jT4aMLpExnYkwWrLGk72D4Dr7ctdS+f8O18wo4BvMQ2O93TXZmSPd
         czAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794384250; x=1794989050; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e02CISDat2rnFU5auy1swbmNQ1NAggjZWxzVKQlZOt0=;
        b=kzpLQfiwu0lF3hZg9xt82iPrgOdaOSV+6MVvCpKSxyopwjMFtTqsiojJJNFe72Iu9w
         S0FlRWDuF4L0+fOBKFDZUYNij3m2zmKyuxxdhi56DKV3i1z9s9+Ff0XcnWuvkiMUOSkp
         OOEV7WDrtpUE5dhjSELEiWfTns7p9uU+uFD3cndCvIMlMqfl76EhWstj8n/909tB4nPN
         YBqKSQ72S9FJAjQXpfBZyASR99LDe+xmnBxCHLNVyGoSyu9E/YCw7s0loJKC1Dlkkiut
         o0OzMR1VNT76qoDQLMkJeXMITaRo0JpCbbmSkR28fFObutvBytpPPfle58m2dri3z9Sk
         nRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384250; x=1794989050;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e02CISDat2rnFU5auy1swbmNQ1NAggjZWxzVKQlZOt0=;
        b=ShJO5o3+SIiZgB5CCxy6yWKlCKvQ0NU9VLOJvxjXPXGJmpY1p8GCp+qy3GWWR9Q2Gb
         ToyndOlfh9j0hoLCi8lBsT2dgDUnRjJ+UpjQX4CyDXmFtI5dyL5yXYXe4+272QMZz+37
         mqcnbB/7U6SXlM3vgz3RgfrSLp91c41zq+IzmkRWqJBMDaZhW7PaLaCf1MWma3G2AkMl
         pE4BYxRckUU7dA4p1mES6+4pfvJS7MPvO45T4i9VxSBFnNyXw05LfnMGbo6DfJQ/y7bH
         FZFZvAPokd4rjWE6L5ksvJWBNgzlXADYD8YrId4c2XiosCkKCAz/SkbYTOPojLPZ8BPu
         N0kg==
X-Forwarded-Encrypted: i=1; AL+hErERl0LOe33c+BPRv6etF/jHT/MSMxwwvWX2OH+8fP/wKGj5XHe5WfZMTOmerJNN/YIcWFLUwzu5/+AZ@vger.kernel.org
X-Gm-Message-State: APuU4Z8B8vbegByYaN/g+fxfDLQ3n5r2IQpozV+PFU6VPoZ+1uXcWnA6
	BVjv1Ckvr3kqL7CKTbVJ5kNbSXkbN+ONMdtX6cwtEhKn6UtOPxxk/t5L6OXqlUtJLrp1/Mraodv
	vs7Hzkh3HFSSmA9d1kfh6dHdt5SrIVzg1HA==
X-Gm-Gg: AYBFou0yYOnN0/RTo3YWwePZsUmGrcYXumIiiHRuCsk+oAuOrmmfCAoW2VarUYUFErF
	0zi3/F6OMpfr+zgxs8XHr8ToWKFTK4wCxSWmlaiTscyfE0Bk32otebCE4nQo1d4dfj024/O+Yz4
	VMsYLL0DXyW8+M18p7ybY29fDSpvOCKWrqMi1BGw/w+4eQoNDq7UUTj17vGJCj+fNI6nFKPMAUO
	IEgu2qhYrwcbDZSXUjdq8eOpcTjR8aZBlN7vJbPwZJFTNH59zV0LxTne6WkQj1/oPytdzCjqXeY
	pfVw6Om0ubVTthXwfpJ9ac4ATjoCV3oePI0djTWa9aV+i1BDVwxrsb6T8X9Gv2I+ylzqLU1FCDG
	rmPbs4MGIABSY7O0Robk8ftJ2pHqmjmQowm+PTWM/245smld8cA9mC50SU+uLrDPmyZ9Rkc/zAr
	Qq8/hA6vIdpXQv+5g/iJVaPsPMiYyoXg==
X-Received: by 2002:a05:7300:561c:b0:36e:2626:4ace with SMTP id
 5a478bee46e88-3768366a866mr2441050eec.5.1794384249564; Wed, 11 Nov 2026
 00:04:09 -0800 (PST)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108151348.204182-1-clamor95@gmail.com> <8f84154c-0296-4c82-a887-de76558df94d@sirena.org.uk>
In-Reply-To: <8f84154c-0296-4c82-a887-de76558df94d@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 11 Nov 2026 10:03:57 +0200
X-Gm-Features: AclHuK8vaEcJ7SqWAmNPakfkNoxiPosAOmNdZbgEthELf7kS-7VilDYNl0DIvFg
Message-ID: <CAPVz0n1LmYHJts91P4OU3WFiUBwcU6sA7Z9McOdLK6cLu6PzvQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] leds: Add driver for MAX8907 LED cell
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-leds@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 10 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 21:0=
3 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, Nov 08, 2026 at 05:13:45PM +0200, Svyatoslav Ryhel wrote:
> > Add a small driver to control the LED cell provided by the MAX8907 PMIC=
.
> > The LED does not require any specific configuration and is folded into =
the
> > PMIC's node.
> >
> > Patch 1 of the series requires this patch:
> > ("regulator: dt-bindings: maxim,max8907: Convert to DT schema")
> > https://lore.kernel.org/lkml/20261027114634.79706-2-clamor95@gmail.com/
>
> This doesn't apply against current code, please check and resend.

It requires commit converting max8907 schema from text to yaml to be
applied first. I assume you may just ack schema adjustment and it will
be picked by Lee, but that is up to you to decide.
