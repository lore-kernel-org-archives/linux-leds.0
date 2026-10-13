Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60F1535FB0
	for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 18:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791916005; cv=none; b=Y+0Fp0OGxiT7TKsViHpW2ktPzSLW8fnDJUOuKcLAzklQdy934rtGBtVoBAEVmAqesORMH/8kDy+3P3q3j4ntqXj/qi0jaWTsY3OEJPhx1lSaqOFSRUXJwXvfuBXCqCM2wYePxDT3ZaMwYPQR0gFzgLMhV1wQlMUdbHfrCV2eZRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791916005; c=relaxed/simple;
	bh=UwhbpU/6xXn9HqiU2ZgLvw9weQ0zsxfvcRisPsU1geE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=RxUbFO44ndgcBZqaC7wDt409e1qLw8D7pHQbbmZcO+nzgLUBy15DKknMxOdBsUFCgbbmfT9YO1LZayM6yRGQRBYE2WamANKsso2eA4NYYL6jzc3Zu2JsxXffg3Q3NVwR0+tyXf5AoC32psT8rb2i1uFehExk0GvzvYiOH3EK/5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QO4c7Lfv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QO4c7Lfv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2C5C1F00899;
	Tue, 13 Oct 2026 18:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791916003;
	bh=UwhbpU/6xXn9HqiU2ZgLvw9weQ0zsxfvcRisPsU1geE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QO4c7LfvHrpvI9qYDVQ4vyQNv3PoyFo/BFB1ebNajnWSRUM7awZYBubvJtoJ/zEQ0
	 7J8oJqGS3J9M85cKysTUFQIxg1FifhXFtAVEklvamlEaELjULqHUdy6sXxAUBjlYAf
	 qOzvBUOMzZmownsPo6ceztoJ8Tw1efvyNmWk5luBDQjqzr73HW4uyw0fWSbKPLO9e5
	 FxMT3infEzO3j2FRf9mFHENAfXFljOwatWN+z5AS7DgAIDfFlV7r24dwy9x4TtqX6U
	 gbVHuhyvWJHuZ1vAHXjo56gk0EAJ+m5e/HqqG90XvCe7QNZHDw8tDDsrFU1cae3HYT
	 Dy6sH3vpRChNg==
Message-ID: <sashiko-outbox-170325@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: leds: skyworks,aat1290: Document
 FLINH pin
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261013181803.496627-3-clamor95@gmail.com>
References: <20261013181803.496627-1-clamor95@gmail.com>
 <20261013181803.496627-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 18:26:42 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Both the AAT1270 and AAT1290 feature a FLINH pin used for mandatory Flash
> inhibition.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013181803.4966=
27-1-clamor95@gmail.com?part=3D2

