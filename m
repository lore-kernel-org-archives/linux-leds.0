Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792558920;
	b=t1ONmO1EhNXiqOl00p3QTs6ca2a+RBvCDOZF7uVbuEBjqOlinqBbS3Q9zN0QQC0XJjLy
	 JeznjkaDBQzrCiiQ+31+mclVG+9x9mHsGIAGrAk9lU6g5qkwez+XbglaqfDMx8VaFaRNh
	 K2sAKpzKdxG1jS9cnTRQymBHh2TSd/neVlabWGe9a6jNukq9EuQGpOTJk21jb4BszROAz
	 MqHEFbGk9ghCaTBE5kI72CoklDmewtxIusFzMmL8f7RHAFBhdGpmnSyBpPltPcF6odVNr
	 98iInk5mJqsKEAZdawrex5a3gk4scBfROsFJQdCN5gBzq/UppTBSTOKCvgdkTsR8U+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792558920;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=t29uevaGvB1MaSjgHl9zAhWX/Hjr+2GWjba4oqBJYSY=;
	b=HUXOjZCKcenfPqlq1KwXr/Sn3iGplj7FcoYPL0xdyi+ER1LlLl8ZgPkpa6Pz84ZoDtb/
	 WfnPf+oXczlFsQtnSKHN6Umigf8rUSq6VNYVwoaTFjOvJwq8sL+oZNG7ZtA5Xi704tYOL
	 +FiLbC+4iDTq4aXR7NzR7Tt32O+0n/Lo7/FZK04PM1hjjX60QpR88480Txhd0SFJtpH6J
	 v+J4dev2+M+geCERmz1SLZNmzex6uClz1bKXqnJa/uzUrh/FX/lPeK0STBlzD5AJYgN+G
	 VNC03ndIzUGSiOBm3n7bYr6YVeQGYXm9NzAhlIecij8dwZbGjm2LI0+s7oCvnP9Vp9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rpe7Rfab;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D702606A319
	for <linux-leds@vger.kernel.org>; Wed, 21 Oct 2026 05:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rpe7Rfab
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF73E1F000C9;
	Wed, 21 Oct 2026 05:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792558920;
	bh=t29uevaGvB1MaSjgHl9zAhWX/Hjr+2GWjba4oqBJYSY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rpe7RfabjCnLVUrompJ7oD2zRDw/Oe84U+VqUN2/b3dfM4u9nJP93fiFk3wvMjGLf
	 gz5ab3KMidJAVUn1j90BvB1bqwD2KbXJjSM41yvu0N2jYO6+MtWX8A+tb6c6QOEHDQ
	 RdYMiop0F9jLyjLzRrmVvd6241xktL8eq5+lVSmXIfks+ngBpol+9u01PhB+s4j1Iv
	 97nxYwjzEogLPE6ar2j8zkUHTiE6tqO8T2J6wQ/5CsvupHrZjma1CO+XPTyBi2S+4O
	 ZQQB6owbCeohyAoI/8cJMKDbIG2Iibs/1aB5ldd4mlesRMov7BTBR/vSBGTQ4k9+33
	 mh7meas83ghnA==
Message-ID: <sashiko-outbox-179797@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] leds: lm3532: Avoid duplicate error messages
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com, linux-leds@vger.kernel.org
Cc: lee@kernel.org
In-Reply-To: <20261021045832.16356-2-phucduc.bui@gmail.com>
References: <20261021045832.16356-1-phucduc.bui@gmail.com>
 <20261021045832.16356-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 05:01:59 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: bui duc phuc <phucduc.bui@gmail.com>
>=20
> Most error paths in lm3532_parse_node() already log errors. Remove
> the redundant error message from lm3532_probe() to avoid duplicate
> logs.
>=20
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021045832.1635=
6-1-phucduc.bui@gmail.com?part=3D2

