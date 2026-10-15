Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293D24D956F
	for <linux-leds@vger.kernel.org>; Thu, 15 Oct 2026 19:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792091112; cv=none; b=oHdxZVtOVeewixOUIxVcM+emK1ZTwy4e5MTsoUj352NmCr8x1udGS9uyOamiPR5/xu/TFXU4ivSbmlCW3Wk3LKhBpKAG1kgu0keBHrCsS2Cz1kwA9wsWTu5rpUutRUc7jYE0CLMtm10PZqEnXM/Q+snflEHDIoM0jKebJfK+i+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792091112; c=relaxed/simple;
	bh=+jMzJs/T4R2mTYclKqhKWhAySLmFtdnbki81rwFbJlo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=sPK9q0xCkUmghs6hVwBG8tYIIRwfmRNBOUUP7xx8Iii8u6cp3REcLxCSas8x+JX0cWNBi8TNd4uTCV1TEw3Nj0c1ookTUtcIRDFw3+ncWOzWCkcrgnakyBTPQ3oQ3G01S55W/CZR25SSPl8wgS0Kjb+A27VFll2UOseIwvBfN5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aawPREBZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aawPREBZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A41121F000C4;
	Thu, 15 Oct 2026 19:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792091110;
	bh=+jMzJs/T4R2mTYclKqhKWhAySLmFtdnbki81rwFbJlo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aawPREBZQp1x3x25pNoSd1GpVuPBLNSvk1Jgyusao7FXLJsjuAJkBxOTBbA1YF3tJ
	 CwZ87mzSh3sKrSwVyE6sPBObHifiVtACgxevQS4dz3IESD2s3D6l1MNBYRux13AihR
	 5MvxUtEwwJuYVSEmn9SJ9IxP/G4RMCSE+S08ym9Xi9mZb1ZMR7cH5jBobediWC7go9
	 ndelT56vAOVYVZUBY0Mkrm9evtAOEz931T/gER0t2egkXf0tPXUalhM5WBExx1DxL2
	 Sh80NDQ7Da4yva1aHi5QjWq4grGavOrGnUof7QeNgRsHo6omkz0WZ+lo5YvTmlgYMB
	 Z3GLorx56bYJQ==
Message-ID: <sashiko-outbox-173345@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] leds: triggers: Add led_trigger_for_each_led()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nikolay Plastinin" <plaztininikolai@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261016-leds-input-events-brightness-v3-1-2c462cafe020@gmail.com>
References: <20261016-leds-input-events-brightness-v3-0-2c462cafe020@gmail.com>
 <20261016-leds-input-events-brightness-v3-1-2c462cafe020@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 19:05:10 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> From: Nikolay Plastinin <plaztininikolai@gmail.com>
>=20
> led_trigger_event() sets one brightness for all LEDs using a trigger.
> A trigger which restores a different brightness per LED needs to iterate
> over the attached LEDs instead.
>=20
> Add led_trigger_for_each_led(), a wrapper around list_for_each_entry_rcu(=
),
> so triggers can perform this iteration without spelling out the list
> members. Document that callers must hold the RCU read lock throughout
> the iteration and must not sleep while accessing the LEDs.
>=20
> Assisted-by: LLM
> Signed-off-by: Nikolay Plastinin <plaztininikolai@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-leds-input=
-events-brightness-v3-0-2c462cafe020@gmail.com?part=3D1

