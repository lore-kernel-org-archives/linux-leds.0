Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421998;
	b=FhvwpXxjmJcicYwjGgDv2bwJKM05wPgDRt7udA0olk8uyWDlpPn0ieUVKQls9SNlKmaq
	 aISCkVshNei5VnLIT5f6RsGmN92orEo6nxn1gGU0qHffyeAktbDVZ0jf3Q1n3WXdUnnAn
	 ysq+1Thm6nqjjevITEUjhkQvRUBRmGJgfPfwWL/pKS1tw/pr80Ewi7Awg6bMR1UyBO8ij
	 oU55270DyjTrjAYbdp4dgnmTZP/wIoeiirSR/zizeohCteOTuV5gqKoY9DpoK6gVm7Fuz
	 xFlh8iS2ePZ3bQO0yOTlYPF1Ro04VTWbtMnXF8WOOATqgUEhniI583ciPhOXG+0qrFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OOK3YCI+wL2FPbOEUCxouW4aFltJ6e++LOuPX8f1U38=;
	b=yHrXbGJpiF4FE5d3PFelb61WkvoKynG35B/ptqD/binaeUY+RC+XboT+YC5Zi489w43I
	 nBFcPi2uW6zbbEBbnFjVJrSNryoZbf7FpaElr4QigT0ff2B0+a5z3cdzd4o9s6GMLUSqQ
	 PfzzssFPTX3KoNrJ1VWivKHrxnMMxx39Va1jy0REVNpkIL/JjDo2M+duEIJla9eFz/op2
	 LFLL9JpRJx2yoYqmZ1A3GPOSt8odFsutt4vdyfmlYBjAv48J+VBVyAbW9/6I7aMMAPA/u
	 X/dh/jGnkSR0EF5A6zJmBpYS5pJQ26QU/FGP9V7+pmCWCBQmm0qP8/6xSxw+gilu38w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=es5j+XNP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF984607886A
	for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2026 14:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF984607886A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=es5j+XNP
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso131843eec.0
        for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2026 07:59:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792421997; cv=none;
        d=google.com; s=arc-20260327;
        b=U7l/oNRJA6jGWSd27b43aQV8hm9EgaGtfhNFJzTQvh0D/g4IIu3b+7V59LIBIZPjA5
         8W/n5oD5pzTI7ihKkvGLAsMIFzPGSHR7H7MA6UDX53VekZ6Xc0DnoU/NBLyVoZEZDnlf
         3QAoVGpQiFY9/ksyLMSbp0bRCEBdg1djZmGh6OGNaW8viZL481p1+QvuSl6OtgGJDz8a
         JLpoA3eO3SvAlpajxAFbT8JEYcgvsqQwjAG1CkXP+SRt5sNCzqxHDdxpCzP3pwyUq8/I
         DCOB3cn5CVZFqJCNcCVUfmcJ/vaC9c5B9UytgMtyhqJ7teVIg/PJejV4Vk5nJCZpmg/z
         ikzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OOK3YCI+wL2FPbOEUCxouW4aFltJ6e++LOuPX8f1U38=;
        fh=eSWvXo9hh76OrYe5+pZ7HC4dQj//ze5oK0QQOMLucGc=;
        b=APTNXQ5kj66BA8AQOBppjG0/IGfm4IjvYwDBQ9d0PPWR+3tW4HOKG4GjNNU980eEnE
         khPf5LmOyugAIGGUJ/3Y409VrTB8AvWloG4oKQwXE0/RNSwhMIdIvpCg+4+IxQZJ1MYR
         QL0yXS/2j9XQv/A2MHy23FLPfuir/gJT5xEuVst16rlLIgCzpvrd2ToZf/6z4ZC5LvCL
         GwSk27+hRWTFhzl1ZZrFh5lKAIFYvyGXZwHdh13FpeP0//tdHv1OvYPPWL5p5FUq/+BA
         UAl+RM/AhiJ9RJmhIct7inF3fpSKZaX2oFunVherF+fVLEh+CvurpkkREV7TZ1eog2Uo
         1w5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792421997; x=1793026797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OOK3YCI+wL2FPbOEUCxouW4aFltJ6e++LOuPX8f1U38=;
        b=es5j+XNPy0vQhY7phMc+bpgICxNIdwzctank8y5azkZD2709Tgu61B+cbluxhH1nPL
         u15/SiYCetQvBwOfZMXGxEgY392oZZvz2jP3rB3yIIFNlwxJSa31cDdkoypPNUJTHCS3
         vqg9TeHZzh5+ecPXweLZy//cbNvvzfMyeRooDGQHFYRKthadi8Vkn30HOKRkWWsNuIqH
         7HXjGYQZ+eMhDD0E+9GN9kfYRo8Mje+We+BtZIPeOOKJ4iBZOTK1Rc/FVS2sZr1SkUm+
         DsjGy6gI+pek3TF2r2cCKTXrJgfYKEtHu25lrALbipY7tHHrLLQsD0DtNbaVvfM56w7v
         tqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421997; x=1793026797;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OOK3YCI+wL2FPbOEUCxouW4aFltJ6e++LOuPX8f1U38=;
        b=n/g6AJ0uIV1nEPl5uQhDhrkLib87WxK4FIal+RO53NHvRR4SzZrbyMdhTAg+WPTKZh
         3ySvgWongTh0YFUV7+sEQSIkMrhg8eonH+uD/KrWuXrFspaDsF57Xfi12VWnjGbU0CwZ
         Dzu+Gp95o70G71bYDhG/0ihrlXfeKV3rXeSBQoMbmDp7BtIZ4S+KClF2biM+ekRjwW9e
         tyE8P/a/zHaugUrwksaaNhpr/pYS/gvsFUdrES+emNZZDHCxEeTcq9YHZNWfUojz6/fW
         Cs3+JbQSdBeq4ppLoM96LeRyHtSbvEHcgAqb7xZgqzLJvFnABQK6sDNXcZmlr1uSVtY5
         Jk0w==
X-Forwarded-Encrypted: i=1; AKwUvBz9CBfUViuEsnkwITnugdUwQMrR5CZRAjz4jOGyTE7lN7cEnNOk96mx+GPgIB8xascM6ETy0tzflouK@vger.kernel.org
X-Gm-Message-State: AFq9FYLciEjn7QJw+IAiQdVR7n6Aa425vyDf/sVQvdNOzeBalcZB5509
	fjVF9r//rEN3MxIR6pmr3i/+DUDlAI82AC0/g7btQotPNiAnt4fFyRaW7wOJgNT+BL/onqzOO3w
	vvbXD5lqBQx20QleTgmUrm8iaNlLILEU=
X-Gm-Gg: AYBFou3GEOE8yHPyv/D9ELeMTttYs3Xwxo0itMAD0v71RYYYX1uCvum8QG8BVSj6g2s
	8/H9o2uNI/8bYh953n98Bl1jInmf+k/YupVLs0e41IaMpFkOkerTRA0V/u9UhSUxY2hSnvhB1pp
	9VS1PG8Du5X29E519t4O7yDt0I3DcxRqyjYkG2gjoBfQOJ0KRoalomm9tTTrIvXPOdC6WY5l8eG
	27Uqw4ZQo+v/xkiVAidQiZziqPRXPw2mxMNaaVstdoBemw1b9KBpcjy5o2xt0Jp9IxuCH+Lt/Rh
	4gAlHYE7DyCIPAbCW7hOtKxJEXVRSVgq9d6QymVDoHa/KLQcimh2yCAPhQ3Ejr9aVx0OjJsEu8I
	wU6H7YVXb2C/zVB1aNo551I0=
X-Received: by 2002:a05:693c:860a:10b0:351:727d:b9c2 with SMTP id
 5a478bee46e88-361a18634bcmr13588245eec.17.1792421996823; Mon, 19 Oct 2026
 07:59:56 -0700 (PDT)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013180933.487013-1-clamor95@gmail.com> <20261013180933.487013-2-clamor95@gmail.com>
 <179198322819.839288.5272985130898382430@kernel.org>
In-Reply-To: <179198322819.839288.5272985130898382430@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 19 Oct 2026 17:59:42 +0300
X-Gm-Features: AclHuK_ZuMv647lBIwF248HcvuKvZ7xEYTSnrsbVhEmmD8JSr7pPARagQdu9MDM
Message-ID: <CAPVz0n08bXQrujADdgQwuLu10JNjOrjBq-zNS6agSBGLLWt0OQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: mfd: Document Skyworks AAT2870
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 19 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:5=
2 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Wrong subject line.
>

What do you mean by "Wrong subject line"? Specify.

> > Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lightin=
g
> > Management Unit.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../bindings/leds/skyworks,aat2870.yaml       | 124 ++++++++++++++++++
> >  1 file changed, 124 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat=
2870.yaml
>
> [...]
>
> --
> Lee Jones
