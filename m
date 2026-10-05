Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743784A207E;
	Mon,  5 Oct 2026 14:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210336; cv=none; b=OlTxD454SWUCILnYO9raHQPtOFuVuS/niuTTl/42eboZxnByKwrdQQhYAT5rt7Fj82QgitfOfFDjKCRkUwZMJjcrWOq0jJuTyTLbxoztK0kDBzMaaFXfBIpFpf6ovaWyyZimECZwjTThv/er2lTlixoZvF1pKn86pGnPHPis8Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210336; c=relaxed/simple;
	bh=I4hL1OWBQs7g88ULHVduWfqqod4VoTo9BHetnFlwf7w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KDrFY1R0zgG+DUxMKyyw5KiIw/Blx/JRYRTd4Gf4yYUfLNYrr3CSrLxOzfu2uwyy0kIC5ryZpxPYD+5TLtGXKFQyVLfkAkbyA/bRHqoXG14tOMZks6meVWrNQxnKVThO8iCuguwhcgO8nEMj0bLVkJXDgqzOe9LrHG5NmqzBklo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EKZXwZLl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EKZXwZLl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 526851F000FF;
	Mon,  5 Oct 2026 14:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791210324;
	bh=I4hL1OWBQs7g88ULHVduWfqqod4VoTo9BHetnFlwf7w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EKZXwZLlcvuv1kaXcafksm2W6Sr6HlJZD/mBmVKehDXdaYhIOVsnbCyEe2V8kiyld
	 p5OYLSoA9qH1sPmD2K2oqXzA3UCu/pDTQLXyod9btlKztr8+cxL8uG3uKnvRy7K7ev
	 IxfwLdqsjOrN8VPskPrN9swH/nmikRRFyuIPLpQ3dhcUY5T+91Oq3waeSmMxCFzFGE
	 lbFUJxobelqUwT7VWfl10f917GiGr3zDNSD3VV2gVBu2rJwzgrvglfTY8Nr8rwh2Vx
	 twOxW/MS1ZzpoiK6bii1N7syEBHeJQUZzoveudGUD2uMkf8y4q2ifsZs9rcFspXdKr
	 FBv6BDcClwa8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 07/11] leds: pca995x: Make output gain configurable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: robh@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <f1ff88185074948a40a1e8e6f022cae4fcc55fc1.1791207391.git.nora.schiffer@ew.tq-group.com>
References: <cover.1791207391.git.nora.schiffer@ew.tq-group.com>
 <f1ff88185074948a40a1e8e6f022cae4fcc55fc1.1791207391.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 14:25:23 +0000
Message-Id: <20261005142524.526851F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The output gain linearly configures the LED current in 255 levels; the
> absolute current depends on both the gain value and the R_ext resistor
> connected to the LED driver. Make the gain configurable in the Device
> Tree instead of hardcoding it to 128, allowing to adjust the current
> for different hardware designs.
>=20
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791207391.gi=
t.nora.schiffer@ew.tq-group.com?part=3D7

