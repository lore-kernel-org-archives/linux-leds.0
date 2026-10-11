Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1E017DFFA;
	Sun, 11 Oct 2026 19:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791746123; cv=none; b=Qrn/mBO79lYee+bEPX99y0wbK5ghlHFjxUSlMd4mpriBADwWfv3uQ/q2azmglQ2oedQ6R1xM4XFWWPwileiWqSI/Y68fH3QObqgzG1efGOX+jWCULcSR8081nBkByd9oIKRZ8UZGtk9XaOdpaYsSC2B8Abbm/wCMxoy+E+sYLFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791746123; c=relaxed/simple;
	bh=xp/oasK2rr+YdOkIQbb2dZ2z/kGMkLVuGV/20IMqkts=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ITp0r/hZhNyfjOwBkzHV0BHKZt0MOk6RPQ/QxOJ2RGJkFZjaX/tEwgU+OGGr3kMRBJUFPcrw1f58W3VD62ib+u642jvqzy9t5FWuBFUJTOZJBW0cAKByhmtOtZhl5/0XR9YZptXzOlLrC55Pc51I0dkL6l+5rIS1Ouze/oZiGa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DfQDKWxF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DfQDKWxF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEEF91F0089B;
	Sun, 11 Oct 2026 19:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791746122;
	bh=xp/oasK2rr+YdOkIQbb2dZ2z/kGMkLVuGV/20IMqkts=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DfQDKWxFzSOqoENPkg2gnXUktGxAiefCA+2aaab9AIx+ZywTEdYmYguP7t652+k1I
	 UOvIZWFbYhTmZkzVhfHTy05n4J9Zh+jN9XJ/2PfNuFVzoPJ0PLthkAs/DsQ98dHRnt
	 XDIXLgn5mKzvUEo3cGUKTpd3j9i4WeNnEIbwzhNepfyCSXPsbcIHdK6B9mP5ZCGNg8
	 0m+O84CYhfUaRoU9rJhVMS3yjYsxkQ1LVnEpUDZbFRYHVa5bIfGTQ9ppZoOQ6WAQzY
	 ITOjTw84J7azga3ztC+bh637UFOg6V87/56m/L1BXXs+IOmvflITCAlAbNG4ZVNwTU
	 YQaPoPhIuDP1A==
Message-ID: <sashiko-outbox-167398@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] leds: flash: lm3643: Describe the LED on the
 Lenovo ThinkPad X9-15 Gen 1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rillian Grant" <rillian.grant@gmail.com>
Cc: conor+dt@kernel.org, linux-leds@vger.kernel.org, lee@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261011191026.149338-5-rillian.grant@gmail.com>
References: <20261011191026.149338-1-rillian.grant@gmail.com>
 <20261011191026.149338-5-rillian.grant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 19:15:21 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The ThinkPad X9-15 Gen 1 enumerates the LM3643 through ACPI (HID
> TXNW3643) without a _DSD, like the X1 Carbon Gen 14. It drives the
> Windows Hello IR flood illuminator with both current sources feeding a
> single LED.
>=20
> The flash limits were obtained from an ETW trace of the SPB class
> extension during a Windows Hello unlock. The Windows driver programs
> 304 mA per current source (code 0x19 with the LED2 override set) and a
> 400 ms flash timeout.
>=20
> There is no vendor value for the torch limit, so use the same
> conservative limit as the X1 Carbon Gen 14.
>=20
> Rename the X1 Carbon Gen 14 nodes after the machine now that the table
> has a second entry. Sources and root node remain shared.
>=20
> Signed-off-by: Rillian Grant <rillian.grant@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011191026.1493=
38-1-rillian.grant@gmail.com?part=3D4

