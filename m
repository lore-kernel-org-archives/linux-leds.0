Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAECD38F922;
	Sat, 15 Aug 2026 23:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786835514; cv=none; b=fCKkBlI6yPwjdn0BocXsRDe4TMR9SV/5bvCThEjsMkGBCNwBzcicm8HQWpMwGhA6LSnm1bAs1gfpulDf9cQDRSFqQVfX9HUd+eDdL+R5/U6qDhh/y7LlFR2aEVfUVn3gPWoKxAGI6VIjj7z137kCv44KBpNs7822WUM5KtOQAx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786835514; c=relaxed/simple;
	bh=clbV2E64xjDCtAuNKctnZGaBIfOtpNBoFIjBDBzhSl4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ImMkow0bsXJWHKKOVttVRpmaL1/vCMZr/GykIu2ESK9Q29ExMl5P2bv0iGBIxPFDZX9e4285Qw7G2CYG58t0CkNWJ4jV1vUlK5NNN0l7Ka+HAFeHxxWEJ6rQQ0UhLPkcZXlDDmYfWnufyix7trCJzyV/aTatvqIdrUoIIdtmLx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EAGLw1oq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EAGLw1oq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 538F11F00A3D;
	Sat, 15 Aug 2026 23:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786835513;
	bh=clbV2E64xjDCtAuNKctnZGaBIfOtpNBoFIjBDBzhSl4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EAGLw1oqkGV7liYHHAIJFHEqV3e/sHjGiHZK2ENwQ4VHnSLB1oYazA3hPli7dfd3O
	 hVKCuR8DW1WIP/B2EDOf57yjfauknx8eM0xt9pyOL9oaVuzE353F46NUSPdQzGDWE0
	 xY/2aSXBFpB156ljWf3ZUkiB+fqsX4Md1n+E/JaZE05YKYaZg0sVwrjs2qJNJFCim3
	 2fgCCa7z+jYcPgefUJ/qJ1b2JqG36zsdOnAK62mgyXPXGj9IoBes3EPHAPmCbVLysL
	 JUEtlYKg6sBKzFK1doAe5CiT86jTAdhAziXgfvFpyxOb04Bki0frQNRqLMCM1y60Ux
	 YYzPouPmKbPjw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 5/7] ptp: ocp: Add profile-driven I2C
 topology support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmad Byagowi" <ahmadexp@gmail.com>
Cc: robh@kernel.org, linux-leds@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org
In-Reply-To: <f3570bdde36b104f5d0309f4f6514c76c44a5e92.1786747084.git.ahmadexp@gmail.com>
References: <cover.1786746757.git.ahmadexp@gmail.com>
 <f3570bdde36b104f5d0309f4f6514c76c44a5e92.1786747084.git.ahmadexp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 23:11:52 +0000
Message-Id: <20260815231153.538F11F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Some Time Card variants route board peripherals through a PCA9546 mux,
> but their peripheral layout depends on the physical board revision.
>=20
> Add reusable software-node construction and client population helpers.
> Use per-device I2C notifications and serialized delayed work to wait for
> the root adapter, instantiate a selected profile, and retry dependencies
> that are not ready yet.
>=20
> Stop the work and remove the mux from a platform-bus unbind notifier
> before the controller driver deletes its root adapter. This prevents a
> new client from being created after i2c_del_adapter() has swept the
> adapter children. Board profiles are added separately.
>=20
> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786746757.gi=
t.ahmadexp@gmail.com?part=3D5

