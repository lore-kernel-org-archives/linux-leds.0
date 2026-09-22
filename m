Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BBE2F260C;
	Tue, 22 Sep 2026 14:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089000; cv=none; b=ri96ht/caLtDkYV0EDmBLqzUYfp63rylUJi+f2ijP/DGEZKKdnbIrsnN7k84a9JZNNwKgfaKIWZoOrvc4F//noxiCzY+VY7K17kqQ7yG646Fk7P+tvxuMB+QUQE/X33DAcozC4pRHM8EV7KI1JGEY/W7p8Koga7pUtIy3djtkbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089000; c=relaxed/simple;
	bh=2Aw0Shy6qXmbN9qanj3T+xgj2SgNSt9Yv7iKGohq/OQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GOjW0OjCtbYgc7tUkrA7HYRi2nqYbcWVx2mtVsHG3Q7qTNeIhfNqXhdR/umsm6Dm1+zc/wxqt/7utFRtPSjD8iEgbJmoVv6R1PbCgTW4EPij8UzXb054Jl8x7dbDn8dEi5QvyvZJVK5FeFGLlMH1VlGT+xXJTKi8tlCiY4CaCQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eGiTuHvX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eGiTuHvX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 022781F000FF;
	Tue, 22 Sep 2026 14:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790088998;
	bh=2Aw0Shy6qXmbN9qanj3T+xgj2SgNSt9Yv7iKGohq/OQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eGiTuHvXv2Gfj9p0A5ysXHKv5SMijxPHwrp6eav00vjG8UJVJrqcB7dmhQYPdrgiq
	 CXkGH0TncQME+VZRXI7tefp348qiyZh5Unk8xikGnd51ga1lwY3PKASsfCJ+J4OZWI
	 05KiJXSFqE6dFGIOAOSH3WeITW0I3G58u+qHHgOQga/lrwqmLcSh4z45eyuVjEhCWU
	 xgGMMYlFCl0lqtNiC1xpoQP5Fr6fVdUq4hFZGU+1b43ktqjPbxR5NXAp2qeQM1VTYP
	 8Mdr+b/RGdO7ZBpzKU590rvzLjNd1be+E75hszrkmqjjJAxpoaYkVrJ37UQNLwbmN8
	 11YqWmJs7AJEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 03/10] leds: pca995x: Fix maximum LED index for
 16-channel variants
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <cb0691ecb93a39e1e5d99af1fc5883d509085664.1790087890.git.nora.schiffer@ew.tq-group.com>
References: <cover.1790087890.git.nora.schiffer@ew.tq-group.com>
 <cb0691ecb93a39e1e5d99af1fc5883d509085664.1790087890.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 14:56:37 +0000
Message-Id: <20260922145638.022781F000FF@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790087890.gi=
t.nora.schiffer@ew.tq-group.com?part=3D3

