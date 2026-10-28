Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176069;
	b=fnHAVxKAB/T56F3dVE2s7Nr3yD1DsCUu9Qs/iVjo0Bgi4yHgs/zPmp6a26RQK5dBf7DN
	 zDUqKNMFD/DfSIUN18BcK6/fPeAZSzIElPY80EQXWXL/WeCDL39ZJwoPHJxnfGS8ZC6pD
	 kyIdpIwc2qvexd5NiddMOluPZmrssRHkGDLWtxdXrDAahWSH7HUeqC+6RcJGYgUbjF+27
	 jKYo7GTjDcT5mzu1BvV2pdMlh/zLqP/1jB+JakilAOjx98CzaT3M7VBZmOlkit/TtFY4S
	 AUsx7pP49MIxYVEbRJyMnxeFhNg9ooeJEJVkZOwXO0s70G0aga4rLkamUyNG6uX9WVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176069;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YrXdHerQqzBQGLKrminQ7/glhQ3NTA1ycQAtoA+b6XM=;
	b=Wrf2P/Zii72v8HFmAfqadN+pmBG7ULKVAFYwKkHL/OPAEgtaKk6aWlAIBnZuMtsQgHfY
	 ASFh0Ixm7R7DAXO3cALQKe5cxOT8KunizufeFV8Zj6JUarsCgdQZkqUPv4Z1+tst5qKPb
	 NDVX/1WbI395G1DKoziqyuhQHKEyCzinDSYevbs2s1Ricc244rnreDihLnVIVZUD8S9Sj
	 RLwgBXY3aZrJxiHWkQHlyk+U1jBv/KC03YCZYKKNOuU2hud42M9384fandw7w0yZyyDsU
	 LZvHVHpLJqV7ojHtORBQo5c/XyhxujfdB12Ic0Gtarbf//1OfXEKspUHJrXG9FsrV0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YzIr5T4g;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CD1606A320
	for <linux-leds@vger.kernel.org>; Wed, 28 Oct 2026 08:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YzIr5T4g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A1001F031E3;
	Wed, 28 Oct 2026 08:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793176068;
	bh=YrXdHerQqzBQGLKrminQ7/glhQ3NTA1ycQAtoA+b6XM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YzIr5T4gxj+UQRUhBM7uMIkpphCE+zumQbUUdT2I9bYZCUkjzKNVztQ02p3XYGZFZ
	 67QR/H9evA54VjsyWH+c1bdK3tgM31pSoprRpZj7bBjEs9DLUfUSr8UFLWEdV5tqYR
	 9Oggj0a4J35dGeAPAB8Ls8sIRlOAJfmwGA1+C9zJLBOAYlbssmQThVFRLLeJ0vtitF
	 X2dYnaR5Wgi62pSj/qlKftxxCAD9iCgSU6XfW8RGXQGYX1/AFS2CDo5uEH1tMLM43p
	 qAf+OhuMKrvMRMIcocMan8TGSL3xD84nQ8nZym09zfhBHEpgiTZ8z8iLKPrFkJKmds
	 8C258tg15R1pg==
Message-ID: <sashiko-outbox-187619@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/10] string: Switch to __nonnull_args() macro
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Ilvokhin" <d@ilvokhin.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <f0d7b2f0dce916f4cde3dd466a5b51a4b88fbdd8.1793027261.git.d@ilvokhin.com>
References: <cover.1793027261.git.d@ilvokhin.com>
 <f0d7b2f0dce916f4cde3dd466a5b51a4b88fbdd8.1793027261.git.d@ilvokhin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 08:27:47 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> Commit 22302af28d3f ("cleanup: Annotate guard constructors with
> nonnull") added the macro __nonnull_args() to wrap raw compiler
> attribute.
>=20
> Replace __attribute__((nonnull)) with __nonnull_args() to
> standardize nonnull attribute usage across the tree and keep the
> attribute's quirks in one place rather than open-coded at every call
> site.
>=20
> Suggested-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> Signed-off-by: Dmitry Ilvokhin <d@ilvokhin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793027261.gi=
t.d@ilvokhin.com?part=3D2

