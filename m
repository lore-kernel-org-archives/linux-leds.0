Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794662324;
	b=jaUYqxODJ5VLSMHaZdR2gZLCoiPUGjg7ck43xaaVJyCjSXhqhr/GuB2by1teuWQR2IYu
	 puZnyBhIAR4nkL4qelrPkBHdCuLL/h8tUbmt6T7DA5E1pfUw4RFdecx7QLXYOY+n9OWwn
	 g609yEwWB6XIH7DqJ5N/KG0StyGO5gVUPBzwLFfg0cSjXSmmcOwfFlneTZHgTZmVrGPdj
	 m7s4yZ75Zbokm8iEcNgKJWeh/rY/F9fdfCxdNgyl+Lko60Wt03dSBacuebIheGye40gIL
	 4J/85Nk0ynNUdcSns50moPVrHJV6nFdFSTLzajLJ3yuHgfrWaJtJ3fS8w9ASLLvhl+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794662324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=58b7G1H1JueuCMWy4Xbmh+zF/T7ZKS+k82iVJRVD894=;
	b=kbyHZObowj2X/HmVjA/DjaET10Oum6WtQgrqX9plge9O7kFzPNCWqqbDEtH2o6lFLlec
	 Cneayrmje32RTUqd9Jo4ZGuXazO9vQyAQEgAnbwX0ipQtdYg8kdiVcd7pH7zANFmQq5sK
	 F2wjVCyxsOdd5Kfj4v/ZoeapyrvF8f92cOJaj2oNhZWKXF86GvFWgmFx6Bwew2PbjCTF5
	 9nW83REjeVSDeiShM1fpBOJQFod0C/LDmzis5LCd0srJRL6v/GKI/Zw1lGYKcMMwfQoVI
	 3ArtAtj0upWJYPD7EAQZ2EwicEzVFDYkMzCKYlchHDc5eCprMQddqBH/8p7vW+Q5jgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hxb2Q1PP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B49606A887
	for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 13:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7B49606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hxb2Q1PP
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c247f6687dcso409493766b.2
        for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 05:18:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794662322; cv=none;
        d=google.com; s=arc-20260327;
        b=f0goER8BeidGdJyrZ/2EbAtVQe1qY0fmKWrlIFJMeWyACB3PivGhuUCS/VQ1TCK5mC
         9aO4sq5kM3WQv+ooufCdhhyV8sLassQdEgcItVJ5NpmkHnCdghMK1G9xad3WKKLcJsvV
         /7/N9KbYcbBUhvDMZc04axwwfBGXsS9pHN7EP5QZYtsVQvauKI2uUvoTznqNfAtFBrK/
         ASQGuXzfF3rt1ukeEDk5ITsJAjlF2U8l6tUJwZija13RR2MWBDNgE7+d+SHwCehPCsfP
         eEva5lwKiVQOm1BydKas5jL737RygKOo1W0BQ4PWObjSzgZUsDwrBzZGb3uUXSyIw+yD
         iF/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=58b7G1H1JueuCMWy4Xbmh+zF/T7ZKS+k82iVJRVD894=;
        fh=lYVqrDHkLQYvvnX9tyj4guU527SsjwT0MhiWCtLQkdU=;
        b=CgioeH+nUiwh+9iYategeIOhHeGiOOOpaGRuVG/USQYNvoCTvusTMkcnefM6dneI2E
         8YfdLOqQqgA+RpJVeJnumNuXmIZBC2ecwnAhwGWT1foV868HumlSNpveaSBK5qq0uTTK
         FSxenVS1bpsSGmKuBEFhuUEyqbqptdKurpF1vwikRA0cImnbTzxAFIWzk7M37f5a88pb
         i6G67tAZA3LigFNQQDpGK4irdLU93oS+b/thWowdE6WCs6HCuPaD3ozMZeu/ta3fdcEs
         E1MxrcadOWE4MzM1MGuN2z6iYo3l8Y9Qs02IUG3+l0GxSWBe+LG3WPSTElLHtTNFW1kg
         o5HA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794662322; x=1795267122; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=58b7G1H1JueuCMWy4Xbmh+zF/T7ZKS+k82iVJRVD894=;
        b=hxb2Q1PPH8JwA5KxJAt4R/8e9pXZaorE4T4mDzztW2iHtFLSPq06sGBd49/7Diz2bR
         7uMe8lGq51rNPP9uySOwpEcN4a2fAA9GIKwsmmoLlzkWnV3hDkxNzdSdFFpv75kVQpwa
         SkUeZ0W0ll0907zajhC/gyKcMzztZI6AWRywpBVK+hJes2fu6TNkdwbN3yfbEUiYlhGi
         QMs/FtRJ/RnY80cPlCHxYZ+xB7YcA2kqXUM+wpY6pEyaItbPt7RnusmjC225prR5lsUu
         2MbIyRABq3fPaNEc7KNuD6nHnFHW4ci6poFVUEek9lbc75/gnF6cvrMeddgA/DZfO1vv
         fDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794662322; x=1795267122;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=58b7G1H1JueuCMWy4Xbmh+zF/T7ZKS+k82iVJRVD894=;
        b=VXzIa9rmJfvo/W3oHNUBnoh9gRxwWOsm0TjdocqBIF8Y94RgR62Cm0+rD7tpY/PGot
         FAPNb0Kx7v9HKlOt6CRnar2WOsrQJWwgYMTU1iE1UQ0pV0KPlviPlOjj+1tXCKLKyeSa
         N437oUzYbOGBWyKZVpo7rec6MN/2qq6spvY5E8hWFHLt0omDXYEnUqSC2caoABqlgNpF
         BJO3AUYrrmcyPATfdSsYWqKhscyxIgoqfz+yaMz/NX0MktGXguxATLLAKIc454w/tHiV
         OmjMr6WBX6nA7gmrjE8wr7tW83M1Zd080nxJiBM64ZaLOXors6deM1b6ftvu9663e6Yb
         WxnQ==
X-Forwarded-Encrypted: i=1; AL+hErFyzUZDIeOfk9kYeoEseF/RFoyodp7s3sMjhSZL7ZJ02OKdstuICPNYwkH6Lcy6nG9fJeN3SjlcxNNp@vger.kernel.org
X-Gm-Message-State: APuU4Z+lSUcK/tmXlBUrx/FoeHqdv4VqNowH2kun/zum6DYRawBohPvd
	5Ro2cW/HcwVA8yUDmz1ppdpdjr2wAYDgBb7TiNlEaB9qGcZfnmKSnmQ+BcOxJ484BdiDA0pLDof
	9kEL+BHkINcLeBxTYUmugPTOddRSQdGo=
X-Gm-Gg: AYBFou2BLyZNiggl28QA3LS4ZSx7a3oAfHUzpuz9ndjDNfOFFgawivARmkSAAR1hgRO
	cjC4GI6T0rsBEgOIoSCnuya6wyQC4egCcImp606Y3uGPGJwbT8t81dS8q/KMkRwLcPr7N5R5YAe
	/PMgGTXz0wao/fHsI0sdeOJmP6PWhIS3vbZmgECUZL2anAHoUHp4uo/J3GA1gi8QgSmrl0x4fEA
	WMj8dFN/hDlIVMAdmo1aR9N3utNcZEsUMtiY3Z95xmGyPQpAkzQEMrqMYOX+Wll163h92Y2SLM3
	V7QhuN1SEVIw3DfZVMwydpLkvQIwL1Yg4fGSMdd5xMJ4UTroHgvdbjG/tZAnpgufaOwpxiSjGql
	wV6ruM7vGGCFylYaFLzEHWKFIWFRIuNc3KsFCjw==
X-Received: by 2002:a17:907:60d3:b0:c31:8441:35ff with SMTP id
 a640c23a62f3a-c50968355eemr493838166b.48.1794662321796; Sat, 14 Nov 2026
 05:18:41 -0800 (PST)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113110546.173624-1-a.shimko.dev@gmail.com>
 <20261113110546.173624-2-a.shimko.dev@gmail.com> <sashiko-outbox-214381@kernel.org>
In-Reply-To: <sashiko-outbox-214381@kernel.org>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Sat, 14 Nov 2026 16:18:30 +0300
X-Gm-Features: AclHuK8H_C_3YSuNOFdtrgvuWk2DTznaljzjLDq-5of7gWhmdigWJCNEeRSV-sc
Message-ID: <CAOPX746fNHakC7O-scwkWTTvgovmbqvMLxbBszQr3vQyqn-8jA@mail.gmail.com>
Subject: Re: [PATCH net-next 1/3] dt-bindings: net: dptel,dap8211r: add led nodes
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 2:06=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> [Severity: Medium]
> Does this leds schema pass dt_binding_check or enforce the 0..2 LED index
> limit?
>
> The leds object omits additionalProperties: false (as well as
> #address-cells and #size-cells), and ^led@[0-2]$ sets
> additionalProperties: true without a compatible property, both of which
> fail DT meta-schema validation.
>
> Because ethernet-phy.yaml# is included in allOf and already defines leds
> with ^led@[a-f0-9]+$, leaving additionalProperties unset on leds allows
> child nodes outside ^led@[0-2]$ (such as led@3) to pass validation via
> ethernet-phy.yaml#, while reg under ^led@[0-2]$ only specifies maxItems: =
1
> without restricting the value to 0..2.
>
> Either drop the leds property block to inherit the definition from
> ethernet-phy.yaml#, or define #address-cells, #size-cells, and
> additionalProperties: false on leds and reference
> /schemas/leds/common.yaml# with unevaluatedProperties: false and
> maximum: 2 on reg under ^led@[0-2]$.

Will fix it.
