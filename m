Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795607454;
	b=w3X8Z7HurjkfPWFU3BiUqOy+xJCtHk+7jDzWWjE8sRVnEB12NSLuIKWdXrh3LnKM2V3b
	 MtOkOis6fPAEQy7TPodyfYhwwllhKrcjB04hgcQOeF9/UhnB+1wycp4QIlL0UkABh185s
	 t+GQJDgBVAIH0JTtKuMCo0NJKSa5fqOK3STJJ0T3nLs9ca0fLtpaPggP+qyYJ9C0+5IQY
	 MZzNaZxppihoW3Vm2P1u9WDA63oS6zVAGU9geNMrHcrBuqsLmYRy3ymGpAedqPJCa0//r
	 UNhyLQ7xbMoYsyrXYw62LYitL0bX05ywNqOpDHP8Y89lwlXM9/UzrCqnRirrFzDU/Rw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AK/FrytH2tf+B+57Lq9wnH5wu00oxO/OQC1ZXkryskE=;
	b=egflcx+XU+Mm5aW3DBfdk+vOZ3WZVvYwW0X/lVpL4uSVWKxSFVr3NiLFPDZf/sRQ8FY/
	 65NB2rqfIu3TtZNMbxPAMga27rUCAs7+sl/N7t/x+ZeFKlO5AJshiVBdklR3bY5gULQaH
	 E1CRqEFQldrkj9JRqWsGPJJ/t/VYQDdQtEtrnKLwRQddP086thwzPbQDAN7nrJej5nNdg
	 2nbwIxGODHCsjtp2KzW5G3f9MEy9ur8haZaRThXKk3AuLDzwr0nsD1eQGClnv7RQKqo5m
	 /8Z+IB8L+pF/jBZKXehdPnh9uHObQbr2jm2cp0DZqZ69FDbH9Y3s5sDIlDVIQEz71dQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cCKrplZv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A375606A33D
	for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 11:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A375606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cCKrplZv
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c5133831027so805991766b.2
        for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 03:50:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795607452; cv=none;
        d=google.com; s=arc-20260327;
        b=ZK5jkY/BT9Ol4kItGGCjyA2D/opiWvgQUnJp+6MEiPbJOj7g5pUQ5iE6/5Yy6X0tC+
         TDbwcjnYVuH9rZezIkoUa7yLBjElFZZoOmKdfD1NkliJwNRStx9ub9U5GlXhD4DhMUsR
         Nu02woXLuyj5VwvneDV1uJclWTmi27moSGXvpUxasUo8gzPs4hUuW0XtYw32ubSZSunq
         SM2PDUfqFj+xkXmMwC8zZrGTD24o35FhvE1kS16cPPRAuRRpdqF49kWpYcAKge/DnJuA
         /DIUCtfojXfrRgRvZbph1phJgdLpkJ242vQ3nsXd8whptmdwVDQ/IrzOlshBtPs+IaBc
         K4sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AK/FrytH2tf+B+57Lq9wnH5wu00oxO/OQC1ZXkryskE=;
        fh=J7haHU8R3ENfUqLtz6v+I1+H5sYccanie8XfUJD+aMo=;
        b=MudIchW66/7ncyVWxrTHAHRQWB/oOg8H8K51D9YcVvTtSsFKWJTXypjaswqXaoCXLp
         pHwMHm6rtqginLa6xxIOe4D9EnoA45b0tKTNXU0pRi2EMRRTYnxCSSwao3jH8nfd9Pw2
         0J7zpSFEQKbvMO3dTutABHgZ6KTX4wdGnOZ8ya2nYbcyaSwyGB0qBXAvG9OmuZTP6SEW
         mbFEuTsUf6BSysqD1gMJdTn6IiaF0x/mEY6hHOCxOpxnHegz47zNZNMygGP7/twlN9BH
         C7afAQk7naarxDbwTMdWM68DXEzrR2lJpUrmu+56HTi18jBXD9yXsApop+QGyzmT7YAC
         +CAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795607452; x=1796212252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AK/FrytH2tf+B+57Lq9wnH5wu00oxO/OQC1ZXkryskE=;
        b=cCKrplZvKmTmChiU/HWkkzSUlDXxoFNlvdQW5t4JT7LvZaH0zotWEszT5kKBJmcN0m
         vPomZV2tFWvlHcSrTbIAZuo5IG+DDIIhkqdzaluUlsEaQbjEEHWkEha+8MbbvKJfHpNJ
         bXl3xKAlMN3VvWpQbWEtysh7LbJqy03KCAvbBb4/lPCY56uKVSlnQ/rDAF0EPCdFR7da
         whyxBm9WY9e0pNEXmVJmY3HAxKfEu64s8CS2jmMBv4BH0cWdBkWz2XGF5xzGEM5kJXEv
         Equ5HQ0aYS3C+qnGSq1ascS5uzpxPVUWCGsWcVKOYAfoIori+vEAGi22Mpu0Ajet8D72
         wlgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607452; x=1796212252;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AK/FrytH2tf+B+57Lq9wnH5wu00oxO/OQC1ZXkryskE=;
        b=vPBS8RFl/sTgINADMDX6s131SgyilRUUaZVM6jghJwqwKZPnDRVcFG4kMIo/V+FWlN
         RR/0dxdpS///LusTqle7LU2WAZ3OJGOpvzFC0WwujaAwRr12mhAF2aYkmeIgS0LbdAbN
         mUpvE0kgl7pwCzYL2YR8DOpDoVurHFv5ZJoj9u0tXvlyNOED3+HKn6gNcJXEzF1B/y4S
         5ZDrOOiWGgtVgQyZDRAPPgbM4/XWW774PLMzlT6IdxOG5Q1E+uB1yRRjFQAQShAe+Zyh
         cNp5ashLa+U4T7W+n3Oqqg0eH2cJmQbLaybzUwXgW1H3T1ZMM01tqQc8//oq2Hzk6xQq
         JmmA==
X-Forwarded-Encrypted: i=1; AL+hErFe34C/PWDfJvoPDviFYmo/G6ubRqFid30ZGGh2WjZ7+Pf0cZR/+l3v8irwRHjz4CIcKP9HjWPt6egc@vger.kernel.org
X-Gm-Message-State: APuU4Z/MldT8ZKepzClCQmnSfxWkJTwugmOE4S0Uy6ZGklttKVhxHy+M
	IxGDa5Ed717uJcOmvrlzCxhqA5fqGG26QGWixFnP/b59aNGiP880I4KPL+ECiRG6fyGnvyAN2TW
	AJaXmmf6VStPnOA1Nm7oPmVX/yH4Re8E=
X-Gm-Gg: AZFdTZcx/54VefdHFVrX5c5XhQ4mn442fWu62x9+nmKPKo2R1V9dIvip1NtQuj0DUEU
	botAf6LanTynFnP2qI+xXslgCUlLRcxHshvZ2wQxJiwz67dF/awcFApR+XhTBKinIh5jtNGEhel
	wbNWiyXHcVtcspm2yIVryGMp6EGh20R+gzVU6plnnQvM0amgjnGlAc/o/PDHdw55T/95JRfDtRU
	o5+BPbE0d7WwE3Z4xmY1u0cZCjNsLscLlxxkyg8dCRP63b9fEuZb7nyX++zp2W7PJy+Zh/CwUZf
	V2aYnJuP+MlBGn6i+OqFrJFom2ksCbrVhc1UR4mBFjXHhqY2Z+9q0ALpDFeqYuv97qdJqwF8GvO
	QuXXBmf81plkN/ZBF03mJmG7d5zGPxityxY0yS5M=
X-Received: by 2002:a17:907:ba01:b0:c50:521f:13de with SMTP id
 a640c23a62f3a-c513a897601mr1361763166b.35.1795607451572; Wed, 25 Nov 2026
 03:50:51 -0800 (PST)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124094914.2993988-1-a.shimko.dev@gmail.com>
 <20261124094914.2993988-4-a.shimko.dev@gmail.com> <977f8fec-4cae-4003-b878-a7eb5aeee48c@lunn.ch>
In-Reply-To: <977f8fec-4cae-4003-b878-a7eb5aeee48c@lunn.ch>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Wed, 25 Nov 2026 14:50:39 +0300
X-Gm-Features: Aa3M54oKEgG2JL9N45FOQuqjvfRbhcjaW8XTghdzQJCbxKeIwx-6DyB-aMwShTI
Message-ID: <CAOPX746TNm7m6d6G-WyUzDptEVRJR0AuUzKa_Hg=P7s8CchhHw@mail.gmail.com>
Subject: Re: [PATCH net-next v5 3/3] net: phy: dap8211r: add PHY LED control support
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, maxime.chevallier@bootlin.com, 
	pavel@ucw.cz, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Wed, Nov 25, 2026 at 12:47=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> On Tue, Nov 24, 2026 at 12:49:12PM +0300, Artem Shimko wrote:
> > Add support for hardware-controlled LEDs and brightness on the DAP8211R
> > PHY. The chip exposes three LEDs that can be programmed to react to lin=
k,
> > speed, duplex, and TX/RX activity or be driven via the force mode.
> >
> > Add the dap8211r_write_ext() helper to access extended registers via th=
e
> > PHY indirect access registers, and implement callbacks for:
> > led_brightness_set(), led_hw_is_supported(), led_hw_control_set(),
> > led_hw_control_get().
> >
> > Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>

Thank you for the review!

Sashiko AI flagged a Medium issue in dap8211r_led_hw_control_get():
the function returns 0 even when LED_x_CON holds a state that cannot
be expressed as rules (TX/RX without ACT_BLINK, or ACT_BLINK without
TX/RX). I'd like to send a v6 that adds:

if (!!(led_mode & DAP8211R_LED_ACT_BLINK) !=3D
   !!(led_mode & (DAP8211R_LED_RX | DAP8211R_LED_TX)))
return -EOPNOTSUPP;

May i keep your Reviewed-by tag on
v6, given that this is a small, targeted fix?

--
Best regards,
artem
