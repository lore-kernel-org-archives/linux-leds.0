Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794662622;
	b=LANAHaJoZ5vee3bRoFSyDyZMZ/e77wp7jaGBm+K1wYHadz9bkQLXZ0j438O9iFUgN89B
	 kogr+dJxBM36Uf7sUm/VjFldkrV/TiECqYnnXr92uy7Gklh/tRxT4z0W+A6BfB2qVhcUB
	 PYMweiBP1MPPw8zhdtiaiB9Lo2tLPUMOJtODqUa2ZyuwdjZXwtIatkbsC0E9uscQPuO+E
	 SZ6WIZSS2Cvr8qNyq/D+cMcqNY6t1aCmsRiEAVcCrzkuZ7W2dZFl+qccrw799PUHoJvyR
	 p58R3yhXYiqWJ9QWGoXO1rIB7xfWraVNkTV13qXNn8sFgCGKQFpoyh5EdXkq3lvvbCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794662622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lrpvAPkDLqKwbdDWFpXF+Yv1YofzLjlvwu6TrBNSFkQ=;
	b=TWpQxND115S2OP0q4FGWPbExCwBaYfL+0fyX2cfbfIuNJFHhbhK3uJ3F/YHDStj6xdkQ
	 2xcDC8lFwdpwPU9uFwII5HEIAFtv68ZE1ASWb740QJGqulgyHiB7S8mA5kvjNAq+zioar
	 sYAz3UHDjPJtYQNrGx9p+1hLF/MTSFb/anKyC5NskpgIvkR5VfvWbPCjx8SswhVBxcr3C
	 fO6AxlZs1F/MBn9rHpQCg8ZSX1SmWmkI9U2XgdmcSgCzbLiihhpe0ppCLajKo1HULSsaZ
	 z1djqqksm7aXZ1AcC8W1E+JdCF/OKRlDlnwfIWpeVHbcOtxpyh3OCEwtanhZjCz1vBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y78keFUu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA2C606A331
	for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 13:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BA2C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y78keFUu
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b7221c0f2cso3339677a12.3
        for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 05:23:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794662620; cv=none;
        d=google.com; s=arc-20260327;
        b=UDNxWxaY8mdj341GXR+phulvph9KMGP8ttjB3wRuKTGEvXvDuystih8F6lKLdW9m2P
         7czxtu4QwGdM8qc7m2mnSkl0tWO51JP21aKBzJg98NJp7oXmBb3NvxJu0EJjklkuyG/p
         5/BEBi3TSWUwCfKQRfQxFhLB8oYhADF1jI7IFRXOEXQfWcTtYC7QeZLAY5fTfIqFydr2
         eRFlZZFltqjlTZ/aEvAHKo9JUKwUqsBo/Kx7i8ue/ZjxkGHACHDO1A9IcwEiKGk+5R3Z
         K4ntk3wzdO/KT95arS6kUAtTwWOh98kb2+NnIDjmrrw+D2QCtRXRgQWWtQ6pUeMEH2F6
         OA9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lrpvAPkDLqKwbdDWFpXF+Yv1YofzLjlvwu6TrBNSFkQ=;
        fh=/vhlHqbDB4hMMFtoxX/z0pqP+aSnqecxkdkAcwSvoh0=;
        b=hNZ1wb7VwcevFjR8no0b5ObEpUEHgy35kVPUzY8MUoFcXr2o0gO9tuHf8k+gR/b9Tl
         3zhiBzy2xUBdtBqeaOBLFBwM4De4RHrN9DiJ7H6gSBze+2hOJGBucwn/mnLAePy5Uml/
         pEj6dC11igCDqJ6W+tRI4/A06oFmjDdt8evDCEtrC9Z764MifH7/2uTjmU69bn0eA0ds
         x/6R7cSOz70rS82fAi2bzO6kPjJmO8fOP9/HrWP3v5s3d1KNMeSjafeel+KtfNhvI0M/
         K2cS4zmsYJReJXzABTUtTg07LGEyt/Rr1wQ2h6u6uickPz9fTUp0gMts4y7ZC/14eZCj
         So0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794662620; x=1795267420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lrpvAPkDLqKwbdDWFpXF+Yv1YofzLjlvwu6TrBNSFkQ=;
        b=Y78keFUubWHygKWEUEc6UgYOqe5S9M63jeE5/qIveIYQC81xCdJBju3d1NuDQCLQ9n
         JX98VPtOMlVf/EENKgM1dP58zZik9ySvZySD14sxBOExMOY1du8PLgko3TeffbAHnJQR
         +xI96m855VJsq7cu01UqgtUq3m9cLzNoE4eF4P50nTrsx44uY7mMJj6/WDJKtAE3JQSf
         EuffLEZRjfDTCcYjxHAbAZ2IiYGvD4VFouBRbWNj7i5xZPaW5HUQZ8J839jjP/qBPEu9
         gJ8rvo6Yfj9N47jrdNOca91CK18qybgh1ZIK1O2nP6wCnj7Wf96/D7VwD+KaAQNdMqHo
         UQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794662620; x=1795267420;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lrpvAPkDLqKwbdDWFpXF+Yv1YofzLjlvwu6TrBNSFkQ=;
        b=qvcBAHGh/mujNKNUEsAbdFEoPCq56hHGzdIh6Ev4dltpfD9l88Lbry2PuwJZ4izeAW
         bDwVXrm3m1bq73Xqo7E6YLmNL4SCVb41ghl1cxB8w1FMvmXHZheIjPemNA1fXLBFDwzW
         EpsyfD2PGG62IHyvt9mSg9vosnRRItS2O2L/Ioeq/CVa2JtwSNc43+Rat+dpo2itPyrd
         vyBvKPqXV3QY5gFKjn9uu4IZnzi6HbBWyG1X503oT+vAAjw98sY81vUohFUFG8z14tAh
         LfnP2DEkMjMqngUeJacXeezUj3o+ecDni4yIDwms9ZosMNZuBMyDuH3bVZna8oViSLZR
         7gQA==
X-Forwarded-Encrypted: i=1; AL+hErEjfRpHd1XxtMrhGzdE/pqhUB4c8SUnOC8vqGcEm7IOK0E9RFV0cmLV6gFT7mQbb3GYklCSaq1T0LHw@vger.kernel.org
X-Gm-Message-State: APuU4Z/THya77vBPhBGrtGjoK6TPHSyEgi6S0e2Wy7IX3Gd9N/rAnohh
	WtfIb1C6hQHs6rjk59KZqhGqDHfSqb7cCrJj+gCReCcb8P8nvAHveoY3X6DFYtIWo5RQ1wfBmb1
	LNC/YHeMlno8DwLks4Mso47OXvNUrGBI=
X-Gm-Gg: AYBFou1R4TtJWZhzNNClCCAu6ebx2SDIX0z6501pK5aMyYfENQDjF7Wtof20Z1l4tGf
	lTLrOPOjB9Xx8W3sASrpdvnsZgnAVqmHXc6Lpa1JlGEGskQbvAtGDgRzkFWcWMcog1anHQ61KLR
	6cUsRQ94ZX6bXbgNRB+KYL0cvjdHSEdOdiU1JHJTB0NcD3VroVVWOYxVO4BLh4iD970vm8n8FxZ
	z5IymoGYUlOVPLNz6wWM44YhOvieN+h9nMFiKCig0OsBzCugY2DVcmguzUd2dTFqTsohyMfC66T
	KX7TFhLM2RzaOZoqniA0eM8HFeGlqvHgin+0wEsKiwD+PvH3HwfLYIhsMOvu4M1B7M7yq/TnBp2
	1PNPbVyOK1qV/uxr36zWIlPz6hOSrd18FPAwAtQ==
X-Received: by 2002:a17:907:8e08:b0:c2a:ad55:b3fa with SMTP id
 a640c23a62f3a-c50961d1e39mr552099666b.7.1794662620446; Sat, 14 Nov 2026
 05:23:40 -0800 (PST)
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
 <20261113110546.173624-3-a.shimko.dev@gmail.com> <583c58dd-3587-4c2f-af5b-9b4a10fd916c@lunn.ch>
In-Reply-To: <583c58dd-3587-4c2f-af5b-9b4a10fd916c@lunn.ch>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Sat, 14 Nov 2026 16:23:29 +0300
X-Gm-Features: AclHuK9xmSYcy3iosLF70NipwjdWhG3wzCm_VjkuxjxD_XFGqVVFRCg6Padg4g0
Message-ID: <CAOPX746ENd5eSAAdhAy6fFdesZ=REU-T+CgcKtwpNJHY0Z9m=w@mail.gmail.com>
Subject: Re: [PATCH net-next 2/3] net: phy: dap8211r: add extended register
 write helper
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, maxime.chevallier@bootlin.com, 
	pavel@ucw.cz, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Fri, Nov 13, 2026 at 11:28=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> > + * The caller must hold the MDIO bus lock.
> > + *
> > + * Return: 0 on success, or negative error code
> > + */
> > +static int dap8211r_write_ext(struct phy_device *phydev, u16 reg, u16 =
data)
> > +{
> > +     int ret;
> > +
> > +     phy_lock_mdio_bus(phydev);
>
> How does this not deadlock, if the caller is already holding the MDIO
> bus lock, as commented on above?

The comment is wrong, my bad, all three helpers (read_ext, write_ext,
modify_ext) take the MDIO bus lock internally.
There is the same mistake in the comments of read_ext() and
modify_ext(), so I will fix all three in v2.

Thank you.

Best regards,
artem
