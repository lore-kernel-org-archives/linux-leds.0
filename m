Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7384249E13C;
	Mon, 19 Oct 2026 10:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404613; cv=none; b=dPghFcA/pzOMFDQAQ4HPp9PYL6Sk8EvlFZl03kvxeEtFBbHTeMpCScUaCLXhJd4n8EXgFIh5S79mOC4Y/eLFZY3ymqFswD19U5J75QWFXO/ncNWcfEtxRAX8j+m4PDlb6hccXGkCz6m71c3sUqD+fv0Mz61KEiGYNtLRrpfUE+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404613; c=relaxed/simple;
	bh=8e6Su5VIzeA7G9Wk3hAaziDayWC+MDI0SEz2Mhil0+M=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=bI8bNoIDORnfhgw1tTM0jiVjpj0XXaRmONjSkucqf2oD8MKxcXMSm3ueT+S4SUpSojfXxseNzwJ3kipHal69I80AZpB7zrMlR4iTL2PlSY9IA6yb8JJz4dNtV1San3LZtAIr9/WDDBEzspVy6rn2yzLD1uXDPWhzGwSLiRnvCMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H7rdLeQ5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H7rdLeQ5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDEB31F000C6;
	Mon, 19 Oct 2026 10:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792404612;
	bh=8e6Su5VIzeA7G9Wk3hAaziDayWC+MDI0SEz2Mhil0+M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H7rdLeQ5RaQLVmF8e1iEqpSSe3TYXm3MwuHRQbyXWBvT3PmiHyDhUeQa0FtJyk5TZ
	 gTRsgOZrI1WQVVTXXMGb4taCPd+i0GNnYq+8mwmF3m60xUYeDp/05hnjKKSL5J+ci+
	 5m+hztPTCg0o6G4f6Z1qoGHAVEeHP+QdUI3gSql/wKqVSLOVpDF2qRP48KsAwXrgGU
	 bO1yKvtzjMMbHnqcb3mRKmPHic3wShVuMEvA8t0C/w7J4DP1qbgSsDs7dUEWW4hhcw
	 UYdTLmo4/p+Xiwb/jbjexbiNHFC3WZFwOv7Os3WiT7ZBDdwGuI7b1qfQmhop6DT8uQ
	 Acrel5SPzz+RQ==
Message-ID: <sashiko-outbox-176956@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 4/7] input: keyboard: Add driver for ASUS
 Transformer dock multimedia keys
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: mfd@lists.linux.dev, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261019100406.103687-5-clamor95@gmail.com>
References: <20261019100406.103687-1-clamor95@gmail.com>
 <20261019100406.103687-5-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 10:10:11 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
>=20
> Add support for multimedia top button row of ASUS Transformer's Mobile
> Dock keyboard. Driver is made that function keys (F1-F12) are used by
> default which suits average Linux use better and with pressing
> ScreenLock + AltGr function keys layout is switched to multimedia keys.
> Only Dock keyboard input events are tracked for AltGr pressing.
>=20
> Co-developed-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019100406.1036=
87-1-clamor95@gmail.com?part=3D4

