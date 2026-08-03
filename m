Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A012F7F10;
	Mon,  3 Aug 2026 15:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785772003; cv=none; b=ENx2pI6lmuv/T1uybKPS6Lu6SnvZkV22+bRsA3nUKMB9gu5zDYFTPESqM9snie9j2sgZqDsjqasHb0m5Be/DDLXuId/eP/7hh0ARd4Qs9D+My/ic7olYFPEn7m+vS8ng+40z1V/1bMGmQlc4ECew+Co4ZLLULGj6boBbZYYj4yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785772003; c=relaxed/simple;
	bh=lF+56LKmDJOZCeoDKA6aB/Lmy9b2o7oc6QU03abTkfg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pboIdgC/wv0qTGrLsPzOBJskUbJXmgQ21/36ZFGL8w0+Lf+0WU52b8ERASDCuRuKIAvU+20ZOWSvgdzQnvfTFyfZt0W76Mk8mRKPUxBueSLFwdXbYla8SKYYKVHitgCuduW9uUrI1S2k+mVUS33fr9knjg2Ysm0fBY7VT9jNe1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WeduTn+b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WeduTn+b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A11B1F000E9;
	Mon,  3 Aug 2026 15:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785772001;
	bh=lF+56LKmDJOZCeoDKA6aB/Lmy9b2o7oc6QU03abTkfg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WeduTn+bghny7rQTYiGdMMEGLjJdamKIurod3t19MJmVZppyYSTrlw4+/Bxclp9Ht
	 EOEyKF7IFuYVneUz0E3C3z1sX6QBiJNN3Na5A6drUDqLrPzvBjsM5Nw5jLWc+1tpPs
	 e8jtON5E+D9Q75+BClKaPUOFbnxuahAfvTiA+DdeQNTOyo1FL4/FuNdd5fwPtW1BnJ
	 smXqxR65fzUYKlwMLqQ5n5Wto0xc0GIHfYOpud3iruECz022uZ4K96omzlTBd/Z3ip
	 O4c3/tRfKIfGgXNcXb++lUm4WKKXKeqVYh/z8wxWV8jwRPqiMh+gWWJG2/GWkVUfGl
	 f55Vp1j8GSgVA==
From: sashiko-bot@kernel.org
Subject: Re: [RFC net-next 3/4] i2c: mux: Propagate software nodes to
 channel adapters
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmad Byagowi" <ahmadexp@gmail.com>
Cc: lee@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <3e76f1dc25b104a2c8558142c12e23b297f9c58c.1785684064.git.ahmadexp@gmail.com>
References: <cover.1785684064.git.ahmadexp@gmail.com>
 <3e76f1dc25b104a2c8558142c12e23b297f9c58c.1785684064.git.ahmadexp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 15:46:40 +0000
Message-Id: <20260803154641.4A11B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Device Tree channel nodes are associated with the adapters created by
> i2c-mux, but equivalent software-node descriptions are not.
>=20
> Find the software-node child whose reg value matches the channel and
> assign it to the new adapter. Keep a reference for the adapter lifetime
> so downstream clients can find the channel by firmware node.
>=20
> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785684064.gi=
t.ahmadexp@gmail.com?part=3D3

