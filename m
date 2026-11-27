Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787503;
	b=fM+xqCaurLmSDUjYeI5BUTadKSAG3fTideSrV4IGAi/yMThsbn+WXsMdn94QhU2N2Muw
	 X+eiKGYXduujpVlSE4bRoiGUrs5pnWMmuHaRHOLGLCd7OcxJa48nU6lWDrPeGoq9dZm6x
	 BL8wjC3c8xqY/FNqImfY4P/HBkJnBc8Y9+D9Em6dGaClEIkSg/AHOt4EyAA6ltO3B9lFU
	 EpjW4IoXHzeNmqgq2VLjxYB8Uj6CNJ1iKVpg1hCQKLFuRAIqTGUDjEKyYOy8cxVu/7cDe
	 GZHfwgJ+C2oErkA/noKzucoOCkwN+x1ntbB18cIoLGnNuDbtrQdZTtRpWqYXg9WAB9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787503;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8Bbyi4cg65X5vsMcwo3+kaEtovF/Muo4Qy6I0b4s++I=;
	b=fm47S6S/J3le6MW6a2v1jK5wnY5jrS39/Pj7+HhJI620MVWTB5A/hGzWiO1PyR2jM0Dx
	 xRKfs4n8q4Zq0v6Wr7mByf9uObg+ifj1GM1q9TtbIoJX8P/0WsOfb+bVUpWJDiDgZLsbA
	 Pu4Es6RaeafdqM1RoYLmE1u9g6nDfOzOOYTvWhfK62ECmWzookeKjnwK1zsJaYxL0t0cL
	 dpI5K9jCZWSdQw/dWzvTCreGmPn9X8YCA2wxWJbCM4llOFhz6LonU0fa+3QFl1nmDDvG6
	 JinsizvOUhxHJVYL6xaaIv5dDkq95ZYsIF1V4gvSzT0yM7JaNONW06XARgQqGOgpuIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NjfJWBal;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF0E606A31C
	for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 13:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NjfJWBal
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F341F0089F;
	Fri, 27 Nov 2026 13:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795787502;
	bh=8Bbyi4cg65X5vsMcwo3+kaEtovF/Muo4Qy6I0b4s++I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NjfJWBal3EOZUGF+oO5Rq8SpK/hnA62iT5CgcjSsK8x2sM3/xY0GO+wOsjEybrV7s
	 56K2OrkJYs79chMDvIDvbzldllgdDYuLdHVFdJYpmtkrOBgS1yhI07LSCoYSkSEQDn
	 mEgrYsf/4KRg2Loc6GZSdGw7NZmCNR0EjFrPtrQeOG+yQmlQk+cw5OYJpDlOgBBVra
	 xdJJvRkxWZdPik9T9f0AL06CuhkL0SEewA3ZWJtq18LvSMwKmlnEWa9Pf8P/XoJ9Kg
	 WfdIkn14nJ2xMB1aXzn2w0N+TZPqNOr4HeyhT1GQe/VbhxeEAx52wFkZNwwhqgGixR
	 QHceVyVpyCCGQ==
Message-ID: <sashiko-outbox-237522@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 0/2] leds: lp50xx: Fix component index and count
 validation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tobias Johansson" <tobias.johansson@axis.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261127-leds-lp50xx-bounds-fixes-v1-0-b9f0399d747e@axis.com>
References: <20261127-leds-lp50xx-bounds-fixes-v1-0-b9f0399d747e@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 13:51:42 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 2-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-leds-lp50x=
x-bounds-fixes-v1-0-b9f0399d747e@axis.com
