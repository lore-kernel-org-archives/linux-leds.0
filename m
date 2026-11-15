Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794732571;
	b=CqSMTDVJUB8tiqLAZ/WM30kjYHutZ8TfQwbkpdxNTaTdeSbg1DmKpWqv3zBZwmw5JOdo
	 VawNuNV0oDXoB+j8xRV+Fj6Ut/Dk3Z1pQpW+vSBvNwBb8i545glx6W2Th0L05/8LkFEa+
	 0MD9uOFWI6uoHF+C3DFksdaVdSRA3BRFYXcqoQQG+CmlicQalPSzffUrd6I5p9i9qw9/a
	 OTLq0IxGuKwshWIq3jnKpZeX4zSYIItHmarW1sXOYlTaFgkvnfKJomr3IqrNARNepUUlt
	 VxmJDKxyeZUhSB8MTN8zhIHLTEGhg465Dg3xaw2mcYKtQyFXBoyUtctKF9vOpg8QATg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794732571;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=v+5kJxdIxKSZiAxVabyw8ia4ggLB312kbx1NwZ+bpRI=;
	b=Gbh/+zvgoAN9lJxfDIvv8B7nfI3zu8dzzEliUj94p/PnzS0gn7DqkT5H5gxGOSxxUpIL
	 M82kcbu3AfBq8NrxSZdNUZqsip9C3W5Do9yJs4iqEY4GEE2kq3dzyBTSo0UbJa5wYYxA8
	 RWuLS4F2xwyeYqtZQmVag+sW0pqzHmfp+6PwVr99pwOc5J7OwZayQRIt+yC4NYJ5s8pqA
	 7pZDMBuuTS56thBKols1GZksDGkp1G5PIBspEIByRAaDUu/8q9G7ojRfjr9CrSZPbKZ6d
	 TXItQrkCS0PLQPvav7Av+Wd03uFfhdcNhJmvwnRpgJOcN8TtPAi8/PZVGBdyx/gxOPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VWyYYs5P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD9D606A31D
	for <linux-leds@vger.kernel.org>; Sun, 15 Nov 2026 08:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VWyYYs5P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E5051F000C6;
	Sun, 15 Nov 2026 08:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794732571;
	bh=v+5kJxdIxKSZiAxVabyw8ia4ggLB312kbx1NwZ+bpRI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VWyYYs5P9Qrn0ocbAd+2FmG3fP5CkfdSuqDAqtGCqQ8g7AERX/5Ua9gIC9Y00iJxa
	 ZE5PCbydtH+naR1IHGH1ipYdwYiSoadv62rZPPsnADLSXRZLVa9KbQPcxpfwLQq3ki
	 RRLXQLCV0hktvhNd0dXYe/b6NUmjp4U4WF8PiUROTEdbIWpMJSUf99nVx7kPuH9AZ0
	 dg1bvVa+1ky0Xt/B8PwM6mL29iynPixpkcxaVQBBcJMpOMPiCjbBVCO7CXfljc5tWR
	 WwHFN82tCWgDQlLIR/R6X2PfEeyRUWV91dFQc7a905A+SyQNRV1tp2ih5OdGrQIt2a
	 J3qhgb4ehN1sg==
Message-ID: <sashiko-outbox-215306@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/2] leds: lm3533: Clean up probe and use managed
 helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261115084347.70592-2-clamor95@gmail.com>
References: <20261115084347.70592-1-clamor95@gmail.com>
 <20261115084347.70592-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 08:49:30 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> Clean up the lm3533 LED driver probe and remove routines by adopting
> managed device helpers and modernizing error handling:
>=20
> - Introduce a local `struct device *dev` variable to clean up repeated
>   `&pdev->dev` references.
> - Use `dev_err_probe()` for cleaner error handling on invalid IDs and
>   LED class registration failures.
> - Switch to `devm_led_classdev_register()` to automatically handle LED
>   class device unregistration, removing the need for manual cleanup in
>   error paths and the `remove` hook.
> - Remove redundant `dev_dbg()` statements and cleanup unused cleanup
>   labels.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115084347.7059=
2-1-clamor95@gmail.com?part=3D1

