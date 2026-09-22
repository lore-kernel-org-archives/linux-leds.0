Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100425349D4;
	Tue, 22 Sep 2026 14:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088984; cv=none; b=HVwd68lTXAxSltVu2g9FQzDqTrtSzj6I1sA1p6xkVdjE80v5x7dYs3rwN7lvdGgrXZ3iM6wAdfIn201k0WBd0kFOpigwmwYilJ53RJYTV5vOSqsWgyQGr+fiLL1yih/4Ro2vH3sgYSwK2OVaxF4Pdmkt05md5DHsmo9C4O/wTTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088984; c=relaxed/simple;
	bh=O5GkbFA2QAO3qRKxpkSIIeX8BKxjJW39yIPWH4WhJVg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PG+V0NqH4LprOWkAkh2kaME6ztkIFNzwQk0jsh7Ta+y8PTsNoC/1rJJv24/Ji8Pemrk3JqIWtMSj9dl/SbA3h8l3t2pqjcl1Q7eI0wxTs6fpLD+dYsmHb3GpPcaGWDWNcBvgmfyYhggxkFudQJELV+Mc53jbWpTRT46ZefBJQRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZjzZzEAO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZjzZzEAO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ABA31F00893;
	Tue, 22 Sep 2026 14:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790088982;
	bh=O5GkbFA2QAO3qRKxpkSIIeX8BKxjJW39yIPWH4WhJVg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZjzZzEAO2/h3C8r3sCES05PxXfsv6WM1m/7fcY4t8awswIbfbuA0QxcqxoaGs1P6M
	 oLL+7AmbRBUW6kSuKoEShzobk35AgjXZZNR1DwbY1DWVjDxfTaLnbKYFxXrIIp+Zxo
	 /1brGKt06HbOE6ybdE5BUmINts70XZpi5HIyrdcqH9pWL/KaVu8V3EEmolJVVg2TMD
	 NV8HCA4bokGBchtV8SGzxIHgRcO0CwMF8E6CvozP2IXNVjeBiFFITY7FbPthMAb5cU
	 fcEtoW7bk4c3fqrFgeetsGd97+OeZWjtmMh/n9ihEI/FqndLQCernMephfne/dUpJk
	 8wJzf9H6rlNUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/10] leds: pca995x: Write global registers before
 creating LED devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-leds@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <f6acbfe43951f266cf6367e28916dd11646879de.1790087890.git.nora.schiffer@ew.tq-group.com>
References: <cover.1790087890.git.nora.schiffer@ew.tq-group.com>
 <f6acbfe43951f266cf6367e28916dd11646879de.1790087890.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 14:56:21 +0000
Message-Id: <20260922145622.1ABA31F00893@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790087890.gi=
t.nora.schiffer@ew.tq-group.com?part=3D5

