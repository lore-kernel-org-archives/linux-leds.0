Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102819;
	b=aUyqoxFbq5dfvTweoQAlzF0gMUrzxPfDrMD9+IIVNpIoppKGsbeoaMPg2hJS+L9R4xXb
	 ysag4a4AR6olmMlT0s+b+R8crRbofpLaolZCj3/SpMIjMH94tXhRP4tBAxQpB7E97yfoz
	 zil36BvYg3Hj1n3etCTgqOZpCw9FJpT/MmE35eWcb/JNateFVCR1bUOtCZPkc+68NkLJs
	 SDPdwfasl4qFcdob+kpKkyfj7hFw5d3LGVzGnNJrFFlVLMYQSNTGyGzoXF8gZCQwBeTBY
	 7yuyv1S6psqdr4E3l991U7Py4nXYgPkPA5DkEV2bzetIuKVOkbdrpHvxWWZL57tbftQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102819;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IC/Gn6QddYQOtce7RNa1uVT3zQVyXC5p5bRomAgDoOg=;
	b=cjZ/S5Ksfz1k6lOWD3Nr3xjUckKIMloHVwVcC603cMAUENahkoHYMppJaH6l3Xm9Hpua
	 aD/hkQGF3dluwLLCuMk1uVnn56aesiSg9C4rmk1lQ9zlJ0KksrbGckixBDAGTl3KyEXgS
	 kT251sNblGxCz/FBc2n5eoXed+yv9sg5kR+O7NQ6QLsYvOoUvLqAtlddmi0SYZazWBcDN
	 aTPFPfrQ2W1/glKmEbmCN/uzcwK0rgjNC5E+0GtrXW9ZmXR1RXzNfwUzVofK44wq+U2yO
	 w0JxJWZRb6hLfNvfa1WXS2OruOtNUR4QwXeJ1LjpQ8O1P8KgfDQXkgo2THN1gbZIPOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CK4pGEuF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FC5606A320
	for <linux-leds@vger.kernel.org>; Tue, 27 Oct 2026 12:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CK4pGEuF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD7B1F01825;
	Tue, 27 Oct 2026 12:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793102818;
	bh=IC/Gn6QddYQOtce7RNa1uVT3zQVyXC5p5bRomAgDoOg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CK4pGEuFtwH+dr3AT78oGxIS9UvhmYQ+MUM2UMGmXZBIU9Ss55EM5pYOdP8ci1Ylp
	 j4K+ButmekBpH0vXODv3059hFs9aunWMfSRlYVbfugDwAQsimobM6qWXXEpEOB6hJC
	 FeVcrvOhaQzBHNzxMNWR8u8ZZo/Xk262Qh1VOOQT5k5VLQt4C0JujslM2roxxJPMz8
	 pCp4P1ucD+8/1ON6a93zAPGun3lNlUjkGbWx5+/BZBcT+lnP2VOKBzFgtk8GhW+z17
	 YESTn3pvWa12GWo9GezAQdgx7dG7m6x1KQNIUzHFqoG8BsrWdihPAgPwgcwdrhTYxV
	 zYbwT13fBO/QQ==
Message-ID: <sashiko-outbox-186505@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/5] leds: trigger: netdev: Report invalid interval
 to user space
Reply-To: sashiko-reviews@lists.linux.dev
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>, linux-leds@vger.kernel.org
Cc: lee@kernel.org
In-Reply-To: <20261027113349.383147-5-alexander.sverdlin@siemens.com>
References: <20261027113349.383147-1-alexander.sverdlin@siemens.com>
 <20261027113349.383147-5-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 12:06:57 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>=20
> interval_store() silently accepts out-of-range values: a write outside
> the [5, 10000] ms bounds returns the full count as if it succeeded, yet
> the interval is left unchanged.
>=20
> Reject out-of-range values with -EINVAL instead.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 06f502f57d0d ("leds: trigger: Introduce a NETDEV trigger")
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027113349.3831=
47-1-alexander.sverdlin@siemens.com?part=3D4

