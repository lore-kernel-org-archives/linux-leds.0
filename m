Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468225;
	b=Ig4348Vr0kNR1Kp52ARczBHLv2MFZs3lttiX4uVo3b1MTxZGN9Kal8skpz3I/9HKcXFi
	 I5ATwKniDP2Ytd+QaxmSD305b38YUx69LX7JG8nLYGl7EyF0ug4+UpKKUan+aVQF7rBbF
	 gVaMnDxNx7xGAhp0fcjcc8DssLhm/2SlvFU437Zu3RxKC/AVD9iPDa41OegCo/fBZH6dC
	 rma9HatkC/896waquK/4uni42hKiuCjDjhI65VcSH7ETLSwLTI79AfptdCGGSxtSFPB35
	 kv+vMCGt2c5gfdNpcD2EwBqKdav9rlfbUWvRF9ConaLZrGLE7rR8DkHeFh2EiYAVUAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468225;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VhFkBTQ0gWGEREBPfkrqs8AQJoot+JAWCPpNT+ZLVy4=;
	b=Fp2QbsUy0bKmem6QnPr0j1RrrgnZzcZn8RpywVmyzc2gUvZtX0u14TBmYtG2nBqNm+Dk
	 0mnHVeDrlrcgtvcbKaJZqnu/24enEwJRfRenQdSw27fu09RqPLuew0nNHl3z3eSafXKAe
	 Mua531+gXZgjC83bTXMEEkT3ebbRbzA/vcJzsBXo+TgbAkU2U2K9WI9MyMkwlt+S6bW0q
	 QiMUceAe4P0RFM4Iqb+r/1F/ET8grlmC58vKxD9tgiQ4LMn/ayVnLiCg8RIwu5JEzFNrh
	 SaPN3LVMt1I1GNicrtIZ+FRMImyiFwNDdUazzw+liibLTZDah26djwOWfM0kwT1cb8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AbvkyAQ9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B71606A31C
	for <linux-leds@vger.kernel.org>; Thu, 12 Nov 2026 07:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AbvkyAQ9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E86781F00A05;
	Thu, 12 Nov 2026 07:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794468225;
	bh=VhFkBTQ0gWGEREBPfkrqs8AQJoot+JAWCPpNT+ZLVy4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AbvkyAQ9c/tJFd3x9vJOBUWpTf8Wof0ipewJPhJSW9OwRdRGvyICbIipGE7FbqGPU
	 9zODVqIHSM6yGy0h21eFKX56qRrSjqC6gQ4wrZDjhcMkdbfR2Otw4froOFPU3LgYHC
	 HXzKeFYFt3QdFWrNx9adcKBphjPW3mouGpkauWqXdEtzEUZYjZb1ZDyNU54PXXYEfm
	 nUun45jvyo3XtR/+un5bd/sKlKxLd7KktWg7EgBG7jMPc6yaxZtbuXOgmD8elOyuHp
	 2WSc7AtoLASHD9EegoDeb1MpD/4Fap83btt5kFkIqktf6PMtnPRqCy3rcCuLPVV7hi
	 jHrcPW7BYtUcQ==
Message-ID: <sashiko-outbox-210598@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: netxbig: Release the GPIO extension device after
 parsing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261112071657.154479-1-zhujun2@cmss.chinamobile.com>
References: <20261112071657.154479-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 07:23:44 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] leds: netxbig: wrong Fixes tag for netxbig_leds_get_of_pdata()
  leak
--

commit e84470b4e5048a49d0dea30c99c1fa99f03b9fb5
Author: Zhu Jun <zhujun2@cmss.chinamobile.com>

> leds: netxbig: Release the GPIO extension device after parsing
>
> netxbig_leds_get_of_pdata() gets a device reference with
> of_find_device_by_node(). Error paths release it, but successful
> parsing returns without putting the device. The parsed platform data
> does not retain that device pointer.
>
> Route successful parsing through the existing device cleanup label.
>
> Fixes: 2976b1798909 ("leds: netxbig: add device tree binding")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

[Severity: Low]
Should the Fixes: tag reference 9af512e81964 ("leds: netxbig: Convert to use
GPIO descriptors") instead?

Commit 2976b1798909 ("leds: netxbig: add device tree binding") only parsed
gpio_ext_np and did not call of_find_device_by_node().  That call was
added in 9af512e81964 ("leds: netxbig: Convert to use GPIO descriptors"),
and 311066aa9ebc ("leds: netxbig: add missing put_device() call in
netxbig_leds_get_of_pdata()") later added put_device() on the error paths
while leaving the success path returning early.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112071657.1544=
79-1-zhujun2@cmss.chinamobile.com?part=3D1
