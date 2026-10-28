Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793209904;
	b=Sca7LWiCAtZVKHlIUfLwQFBLv0Q+CnRVMm82NkQU4598w/Bc1P6ryIIJ7AlGDqQOO44o
	 CwtbNG3MdSqEyTZCeOzHe7QeS+yDatH2TpRyE6lK0eAi7UP8k+faff04gjkF0nO3DZK9k
	 5Ue/ZSt9pJ6ZF/XsZujiCGotgmQnT+RgVIikJxrIHzQINPqhJ9gzkuZrleRzgTrwAXSiu
	 gWDYuHCrEPVUGZEFPeMVxOB4WR/SX3Wc2TABl1g9aTWqntjPAg2tF6V5uPfSiil82XiTn
	 p2DDhZuI6l69yHpngK6DXeICxGsbj1EZETJX+t1f9HI+pEz4DbO72TAQBB3yFwPEHAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793209904;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UZ5+rjBNi+BewuXkaanArcvAAZkaIBbqzLuY44p/cKs=;
	b=y1avyh8HjuYXaga8l92htSa8cOlL/Y26z9yGLKBbPJzYjEJgvYN2n0Wsha861oMjzyd/
	 fD+JGWfajCnJYPa3/bkhH8Zyq7mbOuvKUsouB3fpuvhMD5mvD87FHTYzjyNqsvTTg2SwF
	 IU39Iepa98VFh+72I8C9PtqT7B5oHw9Sc8abFO/qTzGypnGrPS97BuQ4LGSNxvB85r78L
	 ffzhI7ncHIzVpL8JWWUvM31HcJZliK2bkY+9uEkT6U284GlSkprh3ElEvETcXIpqPe+Ae
	 sW2tQzfJ95FWTJEMU4tDFrNtLpCvIXIUeJ+BE3q9q+oE1ut3w4Ef76GUZL5oA2z1M+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k7zI9d3F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238DE606A321
	for <linux-leds@vger.kernel.org>; Wed, 28 Oct 2026 17:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k7zI9d3F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B7361F01825;
	Wed, 28 Oct 2026 17:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793209903;
	bh=UZ5+rjBNi+BewuXkaanArcvAAZkaIBbqzLuY44p/cKs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k7zI9d3FKwC9pNtcnLk/Q2n58gMtKjJg8owH6e9Kcs1OJ7i+/NhM87ULQZXQ5DRQ/
	 Telr5OX6bLN27fMYt52bXMD/b5CTFAbBXNfMeqQ3afYy4LOsYdfn4Geof9nZ8+8mM3
	 tJG0lH2lMIc3x0WbDhCNWVsQ/DstruQgtx23HmLxBHD9Apl1MzMiC5WuYwE3cGlyXt
	 UIyGDjdHh5ogzAVujjdoWkBwfN/LErDHGSzMqGpGmNkiArLDU2+hrLnn0HOwDt9SNv
	 A5rzkPZma/Gqt8ijvgie1RFaWbxaRZiDq4HCvf9NzNxmaKg9wBc5IuhUsz//poKHlO
	 l3UUQq7T0hIjg==
Message-ID: <sashiko-outbox-188257@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] leds: tca6507: Turn the LEDs off on unbind
Reply-To: sashiko-reviews@lists.linux.dev
To: "Danish Khateeb" <danishkhateeb03@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261028174348.64014-3-danishkhateeb03@gmail.com>
References: <20261028174348.64014-1-danishkhateeb03@gmail.com>
 <20261028174348.64014-3-danishkhateeb03@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 17:51:42 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> Unregistering an LED that is on turns it off, and the driver does that
> from its work, which is queued from led_assign(). On unbind the work is
> then cancelled by devres, so if it has not run yet the LED stays on after
> the driver is gone.
>=20
> Flush the work instead of cancelling it. By the time the devres action
> runs, the LEDs and the GPIO chip have been unregistered, and the work
> does not queue itself, so nothing can queue it again.
>=20
> Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028174348.6401=
4-1-danishkhateeb03@gmail.com?part=3D2

