Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9484CEE45;
	Wed, 16 Sep 2026 16:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574493; cv=none; b=PVIBDHm+f8nAdiHLLeZ2eWjc8l1TFD0yOoMsHNznVnyrXCNmr8ZxLYBHbpEdEu4pmoZB9Tu1WPpl7utJpR00YIe7ql7HwFp1/+cKU8suyiIz4VNFG1CAzOSxfxTNIFziCGs6gPr8MfO+l8Eo/NJDdq1jE6q779wwLmeD/KjMhqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574493; c=relaxed/simple;
	bh=Wk9XgGmcHQVvXUj8+nqvLK9pCPloWG6BhBnXDLY4oi0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QKHgVBSzvI1sUfFpsBu/vVwLvjVPAjmqTpTetn/gyCh3gEwQpKPjal5QQxXQ4imSaUmktLtwjkke2isMjTobvwmwUYYZxNUQ/XPhXgWoIC8//53qK/zSBVNrRw9FOwJ+bEq9rCIKEZctmujq6Gb0m/3Ir/9lzeBKY4xK1Ai+wkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZGoCfSXM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZGoCfSXM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A43BA1F00893;
	Wed, 16 Sep 2026 16:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789574491;
	bh=pasL641cc0xhDRHCcrtqvzb2AOetF908Dbl9CK3sJw4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ZGoCfSXMoRZb3zHyt6GF3bp7vP+WVQ/C2TrLDTX/3SLj1gdZdJThSXuQjda4+fcl5
	 ONBPxF2cd+xU9uMqQs/OazJhVn1HBjXJzghxR1uQEUUlXwbNmg0ft7iFs5CpKu9H/6
	 kJeV95qT0ZIV69CFKGAPfB2LaCY4dbyo+mOe8DzBOKCjKP+3fDuSF852ANwQvXR4qr
	 egBtbkcUKnSPNCfExjF9ky/wwWY7ApARD4RoUzHK86Nn3EqO1Secy0DW6kmdpvd2QM
	 JVwkiGx2pVbmMGgfDd/pn6nK8byl/yO6cjCgLCgnKFFNSASJr3le6dAPTI+PEvEC7z
	 70a2YJGZUzpLw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Hemanth Selam <hemanth.selam@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260907045436.18039-1-hemanth.selam@gmail.com>
References: <20260907045436.18039-1-hemanth.selam@gmail.com>
Subject: Re: (subset) [PATCH v2] leds: ss4200: Fix typo "retrive" in
 comment
Message-Id: <178957449042.1761762.6227001641740808572.b4-ty@b4>
Date: Wed, 16 Sep 2026 17:01:30 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Mon, 07 Sep 2026 10:24:36 +0530, Hemanth Selam wrote:
> Correct "retrive" to "retrieve", reported by scripts/checkpatch.pl using
> the misspelling list in scripts/spelling.txt.  Only touches a comment, no
> code changes.
> 
> Since v1 the subject carries the driver name and a capitalised
> description, to match the LED subsystem convention.
> 
> [...]

Applied, thanks!

[1/1] leds: ss4200: Fix typo "retrive" in comment
      commit: 8b35269884491eb07669219468ad425bf9b9f455

--
Lee Jones [李琼斯]

