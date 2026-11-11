Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794425379;
	b=WAeQNH9shaxZCx4ovY5Q9o1nms0Jq/cXtTfVw/idgxtejCMfczr/P8HFDZb3AHibCdZa
	 bg0NBimWNn51oMJ+8UEJ2LDAhya6haSAreaQoy1NPu3jAzK3rz4giHGq5JPP0+xJKgYu0
	 dxDaOXEOZmX8YsYBfMD6Y/iAGxjVA5BXsGyY7Doyb9LdcIrQkShTDUzWkKxxj6v+iJlMc
	 Tkn/zniAYbVE3ohJpJMbgb2JslSqbkDtG51VG4kCIgqddk7WHS+MWzB43ltbm010usO33
	 u4XD7BAAz0PlJA3YAD9HkhIgAiR2TMH4UGeDLXKcMMNHwDruzFRnpVMxMVZ42LDKgiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794425379;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=sii7KJFd1yk89kHGO+hNFF6TpKvTxmesQxNsd0TOM9A=;
	b=biMChIDNaKrAvBBOp8Q4SRJ24ygmQb5XP4fubr+bxZsPohGBEVWzMNYBAe5rQ5lMv/mE
	 O09y2UKoBRWcxASK4zNljyM/sPn8vJVcS0eFk0O37GjTtLIX/itgnnfnH8Rz8UiVABhoZ
	 bowaSt1QvUGtzM5mX2zRr4JADddBhevKGFzR5GvWC7jucL/nJ58FXDqFc9HORmReVbu+S
	 FO1NF86nxUskEQeeL0ZN3lgXxeyTEvARO8gtL4+Lt3M1tUUUoQvYplBH4hT2iSw9Ow+Jn
	 iA5SWMFfSkiGzbyycdLjgFAokrACt5qBZxB2RxQFYf1GDWN5meK1g1jR9lld5m/l0Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=JnTNGkOq;
	arc=none smtp.remote-ip=109.224.244.18
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32D4606A321;
	Wed, 11 Nov 2026 19:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F32D4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=JnTNGkOq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1794425374; x=1794684574;
	bh=sii7KJFd1yk89kHGO+hNFF6TpKvTxmesQxNsd0TOM9A=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=JnTNGkOq2f60wERZWGvjJvCMp/0oDPiWK5WRWjbA7otYYKKDRUa5uD7A2mk8WOymP
	 4yI7EZQJ7xmyCD0ofZ1SP3yJbrJDaslK/MeUt4P79guOq03ZHlqBS3z7e9rGjsn4WC
	 qr2PW6NwBF2TOE37mtUN4x/061TL26i3jr8kf89ULsvvHIw1shpaKAXdsQixr3Y51P
	 VB9tkWTLiIlT48sN+KkdkZPEs5+bDZ3nk1xcS3inCO2rbu/dKcsTGm1XtSbvKYCY3X
	 oLplIBTkfj0g12jtE+RNH5At8yZKNJ6UBSwIhbsIu6IoPI/ypyrm5nQr4lGcyWt4JZ
	 Iqg+QGDGAvgzQ==
Date: Wed, 11 Nov 2026 19:29:31 +0000
To: Rillian Grant <rillian.grant@gmail.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ruslan Koreev <koreev.r@gmail.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] leds: flash: Add support for the TI LM3643 dual LED flash driver
Message-ID: <2f081600-58a2-47b3-808f-b578bb07d41f@protonmail.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 183375a4ed7eb3543fd73e854b6616bb40cc32ea
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Rillian,

On 10/11/26 22:09, Rillian Grant wrote:
> The LM3643 is an I2C dual LED flash driver. Its two high-side current
> sources share a synchronous boost converter and each supports torch and
> flash modes with programmable current and flash timeout alongside fault
> reporting.
>=20
> It also supports connecting both sources together to supply one LED with
> current up to the boost converter's 1.5A maximum. In that case the curren=
t
> will be split between each source symmetrically and the sources will be
> enabled and disabled at the same time.
>=20
> As strobing is toggled chip-wide the driver returns -EBUSY when a sibling
> LED is active.
>=20
> Flash timeouts do not have a constant step. The driver advertises the mos=
t
> granular step and rounds down to the nearest supported value.
>=20
> Register behavior was taken from the datasheet (SNVS967A).
>=20
> Co-developed-by: Ruslan Koreev <koreev.r@gmail.com>
> Signed-off-by: Ruslan Koreev <koreev.r@gmail.com>
> Signed-off-by: Rillian Grant <rillian.grant@gmail.com>

I have tested this series on a Realme C3 phone, which uses Orient Chip=20
OCP81373 IC (register-compatible clone of the LM3643, except the device=20
ID is 0x3A instead of 0x00). I had to modify the driver to support=20
multiple chips, since there's at least one more clone IC (Awinic=20
AW3643). After applying modifications, flash and torch modes were=20
confirmed to work correctly. Once this series is merged, I will send a=20
small series to add support for the OCP81373.

Tested-by: Roman Vivchar <rva333@protonmail.com>

Best regards,
Roman

