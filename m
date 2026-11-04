Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795743;
	b=AB2c7pzPt7iiihqdRcQV71RUdIS8E9s4qLGkJh5atpFEYetSiOySz3MPbA+ZeRMTXEPx
	 pSd4VXCGAdcZU8cRHBQnRioJVyeMzEUNH6gi7c2j8kVrQqdxiX24eqUyNgY7/Lsn/kI5N
	 99KipMYhHABhZPlSHz9WxSRfs8jPE/MQCd1AF4JoKF6MQoy4iYuZL+W/cCd7xuLegLsRZ
	 Q3yMEdcz07Ycz2pXXSTdSdRF24DlJ0fnbrh12Ja0VmoyKHby35+B7P7nXH6JjO6eTSDqE
	 cfdOsEp/GOHaFfMCRY995Z5Z4m5qFHWMiQobULbD4kDv0WEXKtJ2Igv4gqLKqh+N9Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795743;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QSCnCJ90JMrWL8peCJBS8ZGTHYZR9I3NLOXuSAsQC2k=;
	b=KBsfCP++qsrGWg1d7188QZ40VCoWLyPEbC0OHoqsjNrlb0JR3iHgIB+DxnsShjeNY79A
	 9sfoZPYA824/DVFEOyEnSqIcL8pjL8iOiXQf7tYe+LovasOmG+BRfRdJdJ2nskaG1uA7j
	 HsqD0k4UEYxS2v+/rl3UjfW9Y/1M/k71qwv3tG6vJT3ZCFDXIJDZZ+wRBwleJF1PB8L9V
	 nwMKuR31pcV8Mrwn8nB4EB08epEWBnynXsSGyEmrNHW2h9Xywiz9sQJjjmRuFeYVTGOEH
	 GpvveoJo0cUblWMkLqvqPNs7k8IvcOcJpM8n5aK4LtVKq+vAxo4c9JT0rEBZSz0z9YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mBXwyFm9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88190606A31B;
	Wed,  4 Nov 2026 12:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mBXwyFm9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E81D91F0093A;
	Wed,  4 Nov 2026 12:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793795743;
	bh=QSCnCJ90JMrWL8peCJBS8ZGTHYZR9I3NLOXuSAsQC2k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mBXwyFm9RHmR7mQ5zLSzfdZ2aHL/LkNz69l+b9YkQzkAeOQJbpNFgkpFeMxAoN++G
	 rV9ElGVle/N2HnvRkxpNUddiVz+oY3MaUDP0QwkkCLcip3B8jlufRJDTa6XJdjwL9e
	 EFPNpP/PY0/NLempsW8zhN54v0LGGzF5OhdcukKRcomUKNDLS6r3ENJLOTe/3AZ+z9
	 bQ2pvmgCv+N/pGcr3NPVcK5XP/Pmr2XbgaMs25lh1ak3PgA4J84bJzD3FgSVauITnE
	 YSDvW9qN8Z/3pYikCwZV9nySMHWOkKnJ0ploofta93EP7hRWHtJZJ/98Mdm7pRINKI
	 IOIeMeFW0D5Vw==
Message-ID: <sashiko-outbox-197259@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 7/7] power: supply: Add charger driver for Asus
 Transformers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: mfd@lists.linux.dev, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261104122606.215629-8-clamor95@gmail.com>
References: <20261104122606.215629-1-clamor95@gmail.com>
 <20261104122606.215629-8-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 12:35:42 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
>=20
> Add support for charger detection capabilities found in the embedded
> controller of ASUS Transformer devices.
>=20
> Suggested-by: Maxim Schwalm <maxim.schwalm@gmail.com>
> Suggested-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104122606.2156=
29-1-clamor95@gmail.com?part=3D7

