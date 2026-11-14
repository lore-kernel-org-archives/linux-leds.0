Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794670357;
	b=XF2iMu8191oxGxXpNRFF6XRfnLqM9Xst4mqe3Yyjv+DHpbxWRSExtODGBb9R08w3fsTs
	 djIMzVOBq0mnOQNPc1kACj1mFHHvwNJRMzGQDUcu/m3EZ/4DbAuPVroA3aNwBNh/sNdpr
	 T5AzkwW37GWDsSshH8X0nKn+cQ7427ciCKDzO5UdX/OOg2z5vDH5WN/JPwkZhwszVhmf6
	 KQwUV8W4/d2fM1j7Imr3Gn0e4IVlRUpXDI3fI4sLrG5rrJXGluBuO/tNg60vStNhCFl9q
	 6joNkSYJPA3+T6GLejjo1OqBsnMKvrCf41XuV/y9oJFqb7fb/Z7TzXD13T8cIgdXdAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YjN6mtWcOCsjlBrJP8cJGczeHs+0ITKRtbxV1uFNID4=;
	b=V39gVEGyqefT57u3WTxtaqRRHIMPFgYEZObKUulgrZ74A88H4Nk+uAPJkqdbhj5fqwzR
	 Kd7+9/MkFR4Vda7E38yyEvQohuOajweDIIF2eYUNVe1f49VKV8jSxzC1CQBB5r7d9HZX+
	 bE9oc0+19v8IgQx9XlGS96nD2suWhlsm12bkdrlwdhvYGWvorzB9H6QBoGxGtpxa+4dKo
	 rRJ4sudChTbOHZfI7Kec+7u1dGWhT2f1uwOvx5Uu0BhEgY1yMnsjMYbmfvsER7Bz/J3hB
	 VioIpJx+EnyYlH00kq+X9w59PHuVn0Cffj+X7nrIhTevBlSJY4eoZL7qo5K0cyQsOOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pgrOhZRp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3931D606A330
	for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 15:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3931D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pgrOhZRp
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so399799866b.3
        for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 07:32:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794670355; cv=none;
        d=google.com; s=arc-20260327;
        b=q4yfASv3SScpFCwoHMRgQUDZR83hrgdzCNjtrZ52TiSO4JTZmP2PypAnljpiIakeab
         YmtXzJK/axnO6+zttCQZERJW16ZQt/VEzIzq2BL+I/RrnJ+gHCAc4zgjmDrnGzIup6iU
         Jd1JiJjFNALNTjjbcDd8Gol8swQI/wDjQXp4aA2TZ+AORW1A/DrnfwG/vN4GDQBohpmH
         xiAEJTKOL1NIxAztLTzhFQ78tX6zBdliPrJsNABA+fhh8metbfnAcS2v9vyeLtDmC2h5
         AZXGJrmVxXJIi3mZM2UZE59/bQWNpJny17EJpi7x9Pdc1Iuv3l+xpQTwko3cCyHm5g1a
         E50A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YjN6mtWcOCsjlBrJP8cJGczeHs+0ITKRtbxV1uFNID4=;
        fh=PZvPKvaaJDWIbPc6w65TmJgaoMPVnoCybYUeVDPdub0=;
        b=ngID8pIOk2U2nJWRkmG4DdVUgwuJPzPgPX/v7Jzv4JKlM5DrLhb02WWZI9NVcLemPo
         ojmPSY4Itr4crrIzU7TUhjznXtfeHUyicvTzNhB33pU49Ylr9/2KlmQx0jaYFP+8cZ3+
         qGmP98rujnHGJXDJtJaLlr7kI4no7oyBBG1IZ3YN9npNuTj2smJ/eQITgBct6OKELnyr
         WErlU79pCEcLGAp9ydDXM1G6n9w2lOx3UGaqlgUNH4YbQYriC0BMiD5yJk2iGCoA4FhG
         54EKRkCvqjflwJ0KXKFlCzZIUWRr0w6ZJYVulAWbH1pU65JWCQGwG3CqgGkhTjH1pl1f
         hxzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794670355; x=1795275155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YjN6mtWcOCsjlBrJP8cJGczeHs+0ITKRtbxV1uFNID4=;
        b=pgrOhZRp05KImLhRrhLjrWt50iEsX2rldYqswYgsVQNsni6GZ7hMZFhhEAsvzYl+XI
         pDxmlgRtgXeVD282942Y9MC1GgAIs4rNVhm9odZW/f2y2srKDssKPHzL037mIIt7q6UE
         tYe4MH3o76oQ5NfhwSZxAoN+RwnvALSJclUP8WgvpS8B/+J7dSGb4FwmSL9M7f+4e7TI
         jPqnY564o9gAucXpqlDNyAV+Ml9dr6o+UXPsD1dWTw3G6g6JvW7b6X2gsL2fuVsOMB4U
         NYynnyQli0Zr172tTLKl3QPS2vt1trdjq1+3vrarZJXPCSRrSjs+1oogfjcKHzGciZ2B
         zskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794670355; x=1795275155;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjN6mtWcOCsjlBrJP8cJGczeHs+0ITKRtbxV1uFNID4=;
        b=opBqHU2NZu87LzzELicMDiqa+J1o7qNZGHuUdOsz9m321r6xAHeT0Ku5jUnlJD2MyG
         U4M9HKehTN/qIzqHFaodm0NmQwJrTN9i9PpSSBR2aE7C1Jm1WuxWVj5btDv3TsrXteoh
         k6Wh6E0g37Rr1DX2EqAPIuitrR6iZRNLAs3CJE7nCVkj5p3XjXq1s8aEVyPZe2Yd1Da4
         am3ieoail+xKL11c66kTCiXLbVuzF4mGyu4ywvvOW4ia3addYpr36Fo77AsfT8Q5QF+2
         MWKr9FufPgwSBcK5z6NBiDepBCpGEhqli+mYOAxI41xwjqGYKB+WIeY32BfdGt6SJfPl
         Cdmw==
X-Forwarded-Encrypted: i=1; AL+hErGpax8tpcFKW9Fu0mfoN6+omChAxryUusXmfqlRouWkaoqI3xJUQaLBeUkCiGsYuNuuvRQzVlqg0m+g@vger.kernel.org
X-Gm-Message-State: APuU4Z9lqAbEDRrmNFwYZVWAoaasagMvN2zD1Ni1LxE1LZapZakXiupk
	4OgcilhtGDyD5irJsyIr/RdWIimKP0jrEyLdrqTtbIh2XH8VA9paQj/pfLFZjabY3oSNMbL50YL
	bM3ps3brJnaeHVHaeQpK6Y8aH58q8bi0=
X-Gm-Gg: AYBFou2WUMXj1xMcf9Q4Ta5RhCgC5Rm67hxlhVumYB5DPl0nKLyWWQt/Q02sTJhyhz8
	5ngHXrHBki3u6OmOOgrIKHH85JXvXcmHFu9rJ8sVIN8LSgyDgWNmZrri9JBqSj+rkPW6lW6vYO6
	nVAEPkpK+4gGBdXL9T9pgEj3OZhHZ/shBV+uIM5J0W9MknUlQ+MjpfWc18IxOZb2RHHW0eM4YWQ
	f7cDkbwj5hKkKW8QTslKIkQf+lI9f16hmZWUV2l6ZsXv3MtI0PEV/0ntzSEKp604ADzs4eKsS5I
	ckrbeljoLil7IMFxuJvCMj/r+teKq7Kd9DJNgaxVu/CYg47MXpEm/VU3KOCpjXLlSD4vSSAedI7
	7ZWEAR0wbCk8AM7laFySVv4GqZKN13y49iYYORw==
X-Received: by 2002:a17:906:9f8e:b0:c4c:b4fe:c9f1 with SMTP id
 a640c23a62f3a-c5096385149mr526284666b.35.1794670355209; Sat, 14 Nov 2026
 07:32:35 -0800 (PST)
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
 <20261113110546.173624-4-a.shimko.dev@gmail.com> <8ef5b0a7-58f6-4c62-8153-6a9c8d3703f7@lunn.ch>
 <CAOPX745=Mx9Q+Wijt9+=Mmjtdk4fsenEeV2h0gPCvNpqc8kN=A@mail.gmail.com> <43b83555-df27-4b8b-a1d4-bf0cd9c46893@lunn.ch>
In-Reply-To: <43b83555-df27-4b8b-a1d4-bf0cd9c46893@lunn.ch>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Sat, 14 Nov 2026 18:32:24 +0300
X-Gm-Features: AclHuK8X0DQZe3Z31cK9XuFE51dX6ITpI-bm5svIaVnP3cI8G5bXUmovC3tRnYs
Message-ID: <CAOPX746c7uJt1fhV6s2=VjjeinQs+R4zDmMqCO3_UqkMrjzMew@mail.gmail.com>
Subject: Re: [PATCH net-next 3/3] net: phy: dap8211r: add led hardware control support
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, maxime.chevallier@bootlin.com, 
	pavel@ucw.cz, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Sat, Nov 14, 2026 at 6:13=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > The LED_COMCON register does include "force-on/force-off" bits,
> > but i have intentionally chosen not to use them here.
> > To be honest, i=E2=80=99m not yet convinced that they need to be added.
>
> They allow you to implement set_brightness. That is ideally the base
> for all LEDs, being able to turn them on/off. If you can do that, all
> the trigger can work with software driving the LEDs. You can show the
> heartbeat, shift-lock, and all networking settings.
>
> Making use of the hardware to blink on network activity is an optional
> extra, reduced the CPU load etc, but just nice to have.

I got it, thanks for the clarification, will do.

Best regards,
artem
