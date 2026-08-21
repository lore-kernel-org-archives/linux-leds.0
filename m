Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE3E36B937
	for <linux-leds@vger.kernel.org>; Fri, 21 Aug 2026 17:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787333263; cv=none; b=Wl7jbN//+dVUGR3s2gz7z78R0h82Cml3X/pv23ToeXIDW9qsCqP2M0pa79xqyYUmxgs11rxnN1G4sXbW9If6uv7KTxO7ErX+ARSEjLNTCAxbv2Xq22FFBN1NsEUS4B/kFI92yY4l7fijJK0yZz3OE9hbodt+ZW7HERqqU08HVTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787333263; c=relaxed/simple;
	bh=NMM8mGKDClzWUTaDuIISYGITeWS3T6IMRyFu1d7QMDg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GMjOW1VOmqxhBmVdQPBqs40p0kVLcOQXqqPz4YaSyIm6F9ll+PvhZx4gzOSFnpAV0ZXRJV861Jgp26HYBjX7f5Ko5zZwbNOx+Lp6UGk9iH1WQ6uW3z4yfCR2O8YpvFC+pjjPMZGGv7xi38aTfE3r6xU+ewHiGL5zj3oul0AiiQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nD6aBiBP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nD6aBiBP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4931F000E9;
	Fri, 21 Aug 2026 17:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787333262;
	bh=NMM8mGKDClzWUTaDuIISYGITeWS3T6IMRyFu1d7QMDg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nD6aBiBPyZd2WIwWglKtTx9E9VMfQjapn0p7dyZbntbDBa/4nnwIpKLOEkFru998l
	 lugsAnlmYpYspL1q5S/K/4458zMmGHHwA2OACe/FWZnh1D2g4BTaANN8Yno87sKf5A
	 33s5NLzBxYtmrdMAVRx0szU0hoNsC4zI9Y3E35HC3ypBy7WkpCu2Ojdib4OilhO14F
	 ksLNS8drZP59FQGcgyQvcQAcMbti/m2DyruixWm7cWlsNV+QSvjeQmgDl154+TUNwQ
	 wcK36VgFHM9QkOv3uFSBERahuevW4R3GZVlcA6Plw/a8OE6rQ8RY9xig5C/gb7cBuz
	 PO++AjbHRvj5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 11/12] platform/x86: ideapad-laptop: Serialize
 keyboard backlight notifications
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260821-leds-trigger-hw-changed-v5-11-3e00d6c4a936@rong.moe>
References: <20260821-leds-trigger-hw-changed-v5-0-3e00d6c4a936@rong.moe>
 <20260821-leds-trigger-hw-changed-v5-11-3e00d6c4a936@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 17:27:41 +0000
Message-Id: <20260821172741.AD4931F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> ACPI notifications are delivered in dedicated work contexts and may
> arrive simultaneously. In the following change, much work will be done
> while handling the notification, which could lead to potential race
> conditions.
>=20
> Introduce a new mutex to serialize keyboard backlight notifications to
> prevent potential race conditions.
>=20
> Acked-by: Ike Panhc <ikepanhc@gmail.com>
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-leds-trigg=
er-hw-changed-v5-0-3e00d6c4a936@rong.moe?part=3D11

