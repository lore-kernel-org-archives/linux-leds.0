Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9842502546;
	Wed, 30 Sep 2026 15:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781370; cv=none; b=Q8XOkSV1Z4DWzI5PImW6ZjX+K7OIm4Xu6BPM0a4S7wpDZgy2bapgdfNEWHykMR+Y5w0ivYCFMz2WoP6obaKC/btQe668jvHwKDyEmt5Z3d2naCcQkD0YVMm4qRmPDZHaZy8rDoaKw7reSZ4gAV7BFeOqfxBXQ3dPUWeCgW85Y10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781370; c=relaxed/simple;
	bh=skpxRWE2l5kfWJzRBeYxntITW/42/o2Lbsh2zYTX5D8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qAYnXUR/74EW450ifAeb9ziPsWgtMdD27rQTEm5gk/xUfMZYSk0vEUEyBJVrS6lMMyF+g11poDlnxnvUySAcRy8vNKUG/HQTjq/9Q39KcBKdTUmkxDqZvycKOxHsi8rQkPjjhdkgzm8354/lDhE+9JtgtVmmt1ZiiXxUhYNfSfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c0cw9I60; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c0cw9I60"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 203AF1F000FF;
	Wed, 30 Sep 2026 15:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790781354;
	bh=skpxRWE2l5kfWJzRBeYxntITW/42/o2Lbsh2zYTX5D8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c0cw9I60GRkSIQSPgYR5CAx3Uk76mGJSEn2xRLY3sfadHRy+lBCUPJwWTbViOfsSY
	 Cxz8kj07lkZ5j0A2YYz3oBwJY1F0eR9EuoWYTORRcKSfUwIAOMcQJnk/H5V8xcJYn2
	 AR/hAMG5zCo65XNSK73gFh+xVha4nDQAuEZGWcBnCHaXyeDAQMOzdxQI19/RipvFmm
	 EW3HXj25jrNx4NSiJ08rgvBHnye42Nhmi2Ra59wr1r/lDK+eOFhtgFL3q14bInqpLd
	 T5pCDwx2HHsC/1ZBhbnEcMWVpGSTdH+e5+1meAixV7sxbseXmdeSH9FjkECIoytDue
	 f+HzDyAkEC5Rg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 03/10] leds: pca995x: Fix maximum LED index for
 16-channel variants
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: conor+dt@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org
In-Reply-To: <3926421f5734083348a6dc3e3c0d60de5d75a067.1790684839.git.nora.schiffer@ew.tq-group.com>
References: <cover.1790684839.git.nora.schiffer@ew.tq-group.com>
 <3926421f5734083348a6dc3e3c0d60de5d75a067.1790684839.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 15:15:53 +0000
Message-Id: <20260930151554.203AF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The pca995x_chipdef for the 16-channel variants PCA9952 and PCA9955B
> correctly sets num_leds to 16, but the value was not actually used when
> checking and iterating over the LEDs during probe.
>=20
> Fixes: 68d6520d2e76 ("leds: leds-pca995x: Add support for NXP PCA9956B")
> Link: https://sashiko.dev/#/patchset/6d3600f99c77c31166f0b6a5ccfb7f518b53=
c4c9.1788350618.git.nora.schiffer@ew.tq-group.com
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790684839.gi=
t.nora.schiffer@ew.tq-group.com?part=3D3

