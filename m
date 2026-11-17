Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794932670;
	b=VvBJdd4uwmcGTowrqmceUfsYvD80ovAeV3Bzx+xgl5RQ9+RGKhCzfYiF1rm7V6eAwdkp
	 XNIPNBQ2r56P4uWA597GO8OMO4uQcIwBtKMqNBB842iYjerf7ZRJVebCmS2RruMDEAxVn
	 cNV3Zv9W0Ak/YPmuAwtG7RnKX/aFdSVLBJYyco9hPdAFBY38onCB+7EQiSVDwUrWttu27
	 mzqXBbk3CRx4Bz/2Oxr/rbjyjy9wufFFpcnbfC5y8HYAvtgYUnNLXYDbSu5i8uF+qg+SJ
	 /hWZn5MVSy5mKBJ2+A+o8o+rpfNP9ufCVutOwnGPGDYGjUnLkMtrX7wdWbrUn7EGGYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Wxewv3rmU3Q16rUyybTo0MlmIExqFujl8iHouonYjT0=;
	b=2pXbTMKt/Vn1sNQPVVA0EkjCANY0SngQDg8+60yPnXWjV03f4EMjGU44cAeb+i2ctfcu
	 cO+lDNTdvKXGgOLA/l0onsuGVhURvotYwv0HEBi0K8MzUS7zBPHpdAQbnSq8dMKVWB97m
	 TECRVMzLQ6pxvQKtQLdRkoA0iPdE/DLLIA+ANFsfbmINFAJIjyQcNjdSPsJuqQ7q+qqCK
	 eyUvLoaAdnLQ9kdP6/uRlLECXKqE5MRHzlJkIu1iLI50VI9sEZcx8e8kvyq/eN7nJ/cuU
	 0Hn70yMEDDMv+L09eIIfHEfbnOjWxNOCpDlSZyriMNLidopmzQlMCpu8ylnPm2zNT0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cdqQd8jv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67BF606A32C
	for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 16:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E67BF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cdqQd8jv
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c50e26763a4so359021166b.1
        for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 08:24:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794932668; cv=none;
        d=google.com; s=arc-20260327;
        b=Fyu6eR2vSfAV59O+jVW1MUcgQT8a6dZBg2Vf9PkUFCAGHfeLJUFzdGYOIl7CD4TxIF
         CMr1f9nXi35t1loBKdkqwbjVn2O9ZhzNfE4JjlpflGAlYA5GsVIrzRJInC3VvQ/KuwxD
         VvRcSE9qGbGGYsvq9VpkvCPySwuKM0pOIpYn0GxEk1XV0VvUj6j/N7lgB8WkdhrICDiM
         0RIDwWezJ+R22oA+bPDVq6TUucvXf2IKAXKiQYEtnhI6wUt36NmAHWnKE+49uXXUGsYe
         2CmyHHSSfbUbNSKkzJpmz8gi7C2CLlivvhE9i7P9bZefxkUfpYKoilcPD0NAtb/lpOhl
         hQBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wxewv3rmU3Q16rUyybTo0MlmIExqFujl8iHouonYjT0=;
        fh=RkAdjbqilLYA8J3/pu9wS+n4sVL0dNjo6iu9F7hjcXw=;
        b=YuYQ64vuTeE9/927GX+hGJHJdi0EeDbjsFpVdeWoclOtCYnHdOB4hsHG6vkNTYIQ6y
         0AEQPo6iCQA9T4xRG02T7fe7rZYy3Y13RvUm2fN3jhhb6olPUaOIXChHQDBInNMkGbaJ
         /4O1QzneKDBZy2ev9s5cdGuTkgHjGrz2T/u4cf+nbVuRS7IfnIRiulHjN+2cXY5ZhIXh
         XQkPnoCDRbBdI6aQXHxZBsxVjCfEQFNUbbp1KrDYr4CC7k7cTD1BRth/BHxnG4n32/8n
         o13PjPSKinuVJi+0exJMQQOvTsHtPLNg15NpjlTdFQwigI//P7/++pfbxZnoFT5mO7rE
         /18Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794932668; x=1795537468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wxewv3rmU3Q16rUyybTo0MlmIExqFujl8iHouonYjT0=;
        b=cdqQd8jvojBdqf5S+ZlBYnRBB0iv9NrxVYWGKdwsf3qISFsmdiLHOpl+UNMQAzU5Ho
         liy/ffvLgOjWoCC0QMtIRtCSaVqYHa8IArufbSdRmDatd8CHbeYDI8B2a59M2Wrb8O29
         5NvqLtv4LgJz/k1d6g/ZfQrzTO47WvsKobB2eTGboiH6qTmucj3NIxw06T+MZKY4mOTH
         seB2ppD/Pobdk//WYyirPBedKHZ3i6zq8BB2cxTSK/1zF1XG4JeHqeQQ/WrdtMt+RNK3
         5yuPyjkXC22spPcEmapMTeUxRVzMVVw38Bm3+Ce+ODpNYfXU3pJjuC4IOnDK36O1bFx8
         gTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794932668; x=1795537468;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wxewv3rmU3Q16rUyybTo0MlmIExqFujl8iHouonYjT0=;
        b=vJ/GQGAvIktQ4AAyZgM7zo52WetW1gJCLy9KTN4eyWIXx8EJg4Wz+s2S2bCvu8jjXV
         k/a6L0Fgrw/NOGivstgNjAH4rsiwL8jA/GKwIh9/WqGzw14hHNg01MzNLXMLthBufti/
         /LTi/9Qft6y4OMVKkkYfTACD69iddNq6k0Edy8b5+1AZpxC9GPAZOr6CA4Z+5O/JPmud
         IfYoHXm0XsytUZ0a2WtyO1bo15QKIvuEicAIxjSL9LMQxvXCRZhb8nS4/iCBPTqp+edn
         glejwnRDmKyED8a31SaRLGhcFKxy6/fkOxFNijnJkotBUawce0S0bdWp+EkSqx/FiY56
         B7fg==
X-Forwarded-Encrypted: i=1; AL+hErGoDI6sHZ3D0n1+H4TRo4kiljq/kHg+jYFs3XnuRTlpShRXEtGUwNZLK09NYFBtbF9C4/kxvhyW0ndQ@vger.kernel.org
X-Gm-Message-State: APuU4Z/AjwUO/82bZTZ/qBUuefKqXOZRumMZH+N9c1TX/LF7k91/Gyoz
	3vFD3Lugl3D32bTHMDalmZkgfq/wl9THHl71aPye22O9bfPiRl3cls/xhir2YokhD50ZN8PUmgt
	ij5gFhicqToHhNRHwqCIpZGXK46h/ow4=
X-Gm-Gg: AYBFou3tpmIZ0+L+Sbcdvm2r/v+K2/kGCRu7jUANX8LcjwhZr00jCTqkUtslMMKMLqx
	38r57parvXCp/xN8GsbjxFaS0wEdReH3TQPyTXUAsYdTcUGoGMFHOwsnJk8Ddt22/G97rIoCkeo
	LLDpYfqBN/u+f3iiS4saA7BrlAY52KZIYGXEHfVSzMzQkqD9hcszlgBwS8hcDXlNaQRlwVfaVA9
	x9LSHLWkqbXa1v+WYl85kscoRhaW5Qh0OtXmmtT4Ldcp0Gr77tkHjTRTwnQeEfQoC/e5I69kuTi
	s7gelA/PGEt6aowjUjA2C2EnNByP4OuGfepjI8XF4yYdZlWYKmEma3t0S9nm6ftmhnmOCgZr9J8
	4jZDjtiUD/SrBTqpW9hJdf2JibtKUGrRub3U79jbxnp9ljue/7X68JSN2T2YM
X-Received: by 2002:a17:907:d308:b0:c40:f9ea:7387 with SMTP id
 a640c23a62f3a-c5096110ee7mr1203048466b.6.1794932668009; Tue, 17 Nov 2026
 08:24:28 -0800 (PST)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
 <20261117114432.2794961-5-a.shimko.dev@gmail.com> <052adff8-b1d4-4cf2-941c-cfb2725d13a0@lunn.ch>
 <CAOPX745DQDpYh=PNQxDkH1DbfwMRwD8DV81TaX33mNk-9aX3oQ@mail.gmail.com> <6b2ffa4d-b99c-42d1-8729-00f180b955b2@lunn.ch>
In-Reply-To: <6b2ffa4d-b99c-42d1-8729-00f180b955b2@lunn.ch>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 17 Nov 2026 19:24:16 +0300
X-Gm-Features: AclHuK_kxuMbS-JfA12If6aJeq6DU7qmi51H7ZrXORdCaUCFkepguGc-ovdSkpg
Message-ID: <CAOPX74709XiLXLoioDJStTSzzhstC2sHpM4GieAO=3-37E18pw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 4/4] net: phy: dap8211r: add PHY LED control support
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, maxime.chevallier@bootlin.com, 
	pavel@ucw.cz, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 4:49=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > Sashiko said only [1]: Sashiko has reviewed this patch and found no iss=
ues
> > For some reason it replied only to me and linux-leds.
>
> There are two different bots. The netdev one send emails using
> netdev-bot+sashiko@kernel.org, and it gets the reply addresses
> correct. It is also more accurate, less false positives.

Oh, okay, nice

Will wait =3D)

--
Best Regards,
artem
