Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438AA49B1ED;
	Mon,  5 Oct 2026 14:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210278; cv=none; b=BB68LYKODZ8OTw0LsMwzxSE574eP1L73b69RH0qmtt7R/tU9ZxhBdpL3p+QfanTyGGYITaK6cF8DdVjw30vsECwlgnR7bzoDWwYDQR1An9k6uRmNIoHABKAIN2CRrAONSm5gvjnebJcERoxgG+FdOT+eZVP2cjY4h+z9Nm23Qs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210278; c=relaxed/simple;
	bh=9PlViVIR5WA5XEznqZL/ju+W5CCOSEhiu33jZsZIpI4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aNR2JBGHi/73wyeNomE4aMcBohhPScAxpGlDVTtFZXtOUhBd7UmW8h+92NN9VWqy+MJ5/I/FQVpov0Yq+QgfREFgshjYEW7xRNSJwRTb2ASw6g4tZ/p9Y2TyjLcxJrvQiGDFQKHXO2YOQgIgMUmGV3cp5ZnDxR1A28YAN4D042o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bqg8oiZ5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bqg8oiZ5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 668961F00898;
	Mon,  5 Oct 2026 14:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791210267;
	bh=9PlViVIR5WA5XEznqZL/ju+W5CCOSEhiu33jZsZIpI4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bqg8oiZ5ew67p2pQugs9+Bu100ox1BFuGEvxbGjLW2xrgTg+2mzj0ERSdAgVr+cST
	 0uV0YDU8LqM0ALTTOGgaLllZkH9dh2WGlXAOGOl3ubuTpUdj2TAs19VXz/f/oQFAEv
	 j6kUMaZ7qMvfVOJ04eeeJrvCxo8uE1BI6c6egpptGdfrr/23KPDP97ParFYkiF1eIG
	 6xV0hs1DUcpxsfuSAmRKcaHVovAwpWk6h3+KXtRXhISXodWQdw8UxQOyeqXvYts2GE
	 Da5tfHXpKyYPOgRjr6Db1JhA2Dd7nFIcQc4ZBDJ08rNMa3G0YzQpj/pRahM4bkCPrX
	 hOs5QT35afmhg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 05/11] leds: pca995x: Write global registers before
 creating LED devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: robh@kernel.org, conor+dt@kernel.org, lee@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <c46f7e126c08a53a8f04643b5bc8de3145ce84bd.1791207391.git.nora.schiffer@ew.tq-group.com>
References: <cover.1791207391.git.nora.schiffer@ew.tq-group.com>
 <c46f7e126c08a53a8f04643b5bc8de3145ce84bd.1791207391.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 14:24:27 +0000
Message-Id: <20261005142427.668961F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The hardware setup should be finished before the devices become visible
> to userspace.
>=20
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791207391.gi=
t.nora.schiffer@ew.tq-group.com?part=3D5

