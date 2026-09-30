Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C97849AA24;
	Wed, 30 Sep 2026 15:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790783692; cv=none; b=fgfnlWl5ghZK/fyNrFZjIrMxGYxpSK9afTla0XFmFk5lXFKFE3I2+Ax3MxIYd3XsMSnT7r1yZVdfZ/Lr53s8pWgEk2k0/n+qg4U/aakVesouaCL/Oo81rXHU7/XCAGy9/U8SL6RPVGB/OmQ1fgXBsgrlA762ciQvbqbtY7UkqQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790783692; c=relaxed/simple;
	bh=jm/q5yR96AI8I/IiLiC4498yVgfktYtxIUm7CiZQ2fM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pV/dLLxegixQXWQUTfid6qUS47jIJsija8k0s0A2QjSyZa9K9A349lDxmeYGrRorOj+lxoNj1zVnp/Owsz1D/DDuRFmY7yFVcliHu85ClnT4FusQQz2EtHvTFhXzVGERCcbW+b/ktvlOSMItbvPLpbRbOuZNbiJ1mN1Ygio+r/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TZflfv9N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TZflfv9N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28EF01F00893;
	Wed, 30 Sep 2026 15:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790783688;
	bh=jm/q5yR96AI8I/IiLiC4498yVgfktYtxIUm7CiZQ2fM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TZflfv9Nim7wjxwhTMsPVJ4hjYB1rNiFBN9dcTLIsJEtovjcMlRde35F/05bhWUcc
	 p+Ycuck1ueg6/EWla/6rBlduxpYmKkzgzdxv0v8quQLVycwib8LXHvaz/QG5oVz5lk
	 5WkjstAYQMrLR6xBcdyRUABGJyI1KQBzhugzBVNizOfukxiv9V9KwwvJ9Or5JujL9p
	 gTGQh02kV7opa8oxb6ZhNUrl4cEGe93IRYufS0f1dvg19OJH9KWiJ3dzmyVvb2eY66
	 IN9Z+4F7d7rhzvAhOjNXJyp08t8Lr9LvqHGowqmx+sQJKzVHH/fy/wGQCs/iJC6p54
	 rbPUQTw10po5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 09/10] leds: pca995x: Do not use full on LED mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org, lee@kernel.org, robh@kernel.org
In-Reply-To: <93c090b77e2049c75439a680a1d3b86e2e5a29d3.1790684839.git.nora.schiffer@ew.tq-group.com>
References: <cover.1790684839.git.nora.schiffer@ew.tq-group.com>
 <93c090b77e2049c75439a680a1d3b86e2e5a29d3.1790684839.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 15:54:47 +0000
Message-Id: <20260930155448.28EF01F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> LEDs in full on mode are unaffected by group dimming. Avoid using it,
> so group dimming is applied consistently.
>=20
> This slightly changes the brightness at maximum (from 100% to 255/256
> duty cycle), which should be imperceptible; arguably it is also more
> consistent with the other brightness levels, as it will now scale
> linearly from 0/256 to 255/256 over the whole range.
>=20
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790684839.gi=
t.nora.schiffer@ew.tq-group.com?part=3D9

