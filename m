Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176068;
	b=nXcZhDdbllpHRRgG7231kKQxO8WBzkDt+3ReBreWd/u3kWeraZJkLhDdXVWKsUAZOk7F
	 FJEkzv3faqvXU412+bN2qVKRB1Z2oTS9kHjcG/0BxqyQFGxMWupUOTbpmLueKKQYQ9LDy
	 AITpAGrhXZLAIF8atkA88EclsqoQWRv06WkGKYVkHhh6RTf39ywoDDwF+4gdRtvJs52s+
	 ++rCavvYR3CtPQBKv8dxA8BWiFbDR4Lh0mGMJ5XkQ6HrBQZbV7GZ6ueL95jmQfd/fU9Ea
	 UQy/qnSDycR8cW0l/PpPOpR7cO1s3bJIbRaDjRa3gOIgByqbUK8OWdjGv1G8KJ8ZFOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176068;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6NZO65XRDkg1d/leK9twU/iDBpEn4gJLNpZY0SsrqyY=;
	b=o7z3WtCceTrq8xWEHrrGOXHJj3buA/3QtmYjfoo7muaO4FZKcCgCalRriFVuHYwr2Vjq
	 B8TcNCPAByLBhfmez/bxG493ZZ5F4pOkCp6ecyk9aAqr7BdhgvzZ36BpCRg6HP2tRqyjP
	 +FIjNVdszFuqHVkJoSnX/TZrmUsiqEqF7NGQIXRgyTftdMldJx42fZSquBlgEOKLDQQto
	 7W4fcDWpejtC5XhBv8s1f1Jy6eme+fTGX+HPuvZQsT5t6Lb9gBpz00RC+yzwY08bX8/m9
	 8B8xf5eEfTteF5rnonfD8s4gK2gfZK97FXFuUaRa2uqUmwSXP2T0v7Qpi/XvCXehK6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mbLyqZkG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A651606A31D
	for <linux-leds@vger.kernel.org>; Wed, 28 Oct 2026 08:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mbLyqZkG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B841F031E1;
	Wed, 28 Oct 2026 08:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793176067;
	bh=6NZO65XRDkg1d/leK9twU/iDBpEn4gJLNpZY0SsrqyY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mbLyqZkGorfxBMGH20evT1nT04z0DH7IaxfmhZuoGlRfJvpF4ACyLiPA4GB7tpQPU
	 OGEJYn9niq79NDcFAKEI96iFbF2mdxV7WmOCrc6AlzZoedw8R6j4DDS9jeXppQP36E
	 Jlu3LOaO2rcxMf/8f3dD7PchwI9QakfcDMQjcN9XQmZwQsEoNpnbJjKUaYS4O8aeu/
	 5toIZNhH/fUpdf/j2JvGuPWewb+MObM4VLRRElqngEyA3tzrg/Uha6JXjNy6ilSQHy
	 JiGnQuCMut048DpB++x9fI6SoHlmbalEcgPRVKIRgkIrMxfZJa8cg3sV3IQK+nJloJ
	 7S9oub7PnnPVg==
Message-ID: <sashiko-outbox-187618@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/10] docs: xforms_lists: support __nonnull_args()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Ilvokhin" <d@ilvokhin.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <fd33c32bb1f1cf80721887b6e9bfa49749e03d20.1793027261.git.d@ilvokhin.com>
References: <cover.1793027261.git.d@ilvokhin.com>
 <fd33c32bb1f1cf80721887b6e9bfa49749e03d20.1793027261.git.d@ilvokhin.com>
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

> Avoid kernel-doc warnings by supporting __nonnull_args()
> as a function transform.
>=20
> This is a preparatory change for the treewide migration from
> __attribute__((nonnull)) to __nonnull_args() macro.
>=20
> Signed-off-by: Dmitry Ilvokhin <d@ilvokhin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793027261.gi=
t.d@ilvokhin.com?part=3D1

