Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FB43B8D7B
	for <linux-leds@vger.kernel.org>; Mon, 28 Sep 2026 10:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790590110; cv=none; b=d6jQkEJt6Qd2fTVyl5kbKIIOw1fYQPIdO5YlalL2mJCmdCGZe7UDRA4Lu2QeFWIkb6futQS6NktSQNXq1Iyn3A+pNsVj88hxBC7oMAey1GXL4vcBBRoA+EPM8WFzeE1Aq8mqFCs6vnMeqRV+Qv+KzroLoWC59XgUJPE+dlUSFZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790590110; c=relaxed/simple;
	bh=XhAixuhqSe/dsQG0NsclCcJxEyaEsGjyMcp/KpLvQIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mgtcnFGphN8+X4zKBQ7mg/6Aa/3woQJJ6XyT9W7sKJvySzTsBWp0WCJmoMS6+7ekDWe+9WRZrgpxJBeou6KPAA37SPlUveUvn7xudn/32M139gzHiBRxh7nX7VIpRC1ti8WtAGnOdFEfUE2zaFUWF9YODOALAA2NHJ7SDxNocgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tHFTKaDY; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tHFTKaDY"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a9edfc851so346764066b.0
        for <linux-leds@vger.kernel.org>; Mon, 28 Sep 2026 03:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790590107; x=1791194907; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wTVCY6beQgFN5l4WsD2fqNqKkKl80zolb7oRNqVRMfQ=;
        b=tHFTKaDYcRQQkzhjpAs68UQ1AOyyrNIaSXTFTDm+p6WCmvk+msi+zPE6bAD0aLiAyJ
         ttuGTFUc2QMCdbJekz7zZ7j1m/XFPcLcixjH7UDXCA/v2iWb5+7tJc3yZCOnCzi1MXDA
         +J+aiTpiosBQBpqHs/LYelsau90WY8XuXa3ywHWMgIDA4VC79T478Q79lJjcR7OMaaAE
         EamD2IA9cnnhHtBA6qdMFCmvBNvrzJlb4Dz2DfQoWlxV76H73JWPbRyGbP+t0XlVtVTT
         mQFqNwh7KaLaNZC9rr4KbxycUJIFQlMM6X9E/7F+zrtPJArNO7fiKbmMdxWJrUw4gRSC
         kViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790590107; x=1791194907;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wTVCY6beQgFN5l4WsD2fqNqKkKl80zolb7oRNqVRMfQ=;
        b=YZlylHFeQVOJoRZk3KZl8kuP93CW55H/faJpo70pH3fJG0rvmsttpznOIFnnljeJni
         Xt9yWW987rz7ttIpFSKpmCYaIYvKzPEKQvKx6q2Um59wheD+3gqUjQayK46Evp1cthM7
         FuipK+4k7IWOsLK3ABV9B2URjVAhgM3VGmFGh2aOSEJEKhr2t6uRrmgO6tXlqrh3GCFt
         2u/73BEDFj7teF3W+hD7Bl/nwonqocgdOzNbcG4JVfw+61MCHia9WlhktLLHQitgw7mi
         tZTCOKVuVTUVWjBq6k4M895jIL/bezDGBYGV91HHIJAk0jPZrc2V4AMBGNVnCAzmfhFN
         3jYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRqcgKzwK6sRrLc8y27ng59100HIsu471D5LNWIH+sU0uDHwZ0CrWRGAS9kdqFsBn4YRGrg13xNGT7@vger.kernel.org
X-Gm-Message-State: AFuF++mDJgzOKLTnQzrY0kOE2IrFFyVzsrr4RhWi9rZJX+nVFHRgas29
	V7jX/0uzTyDucqSAPNunYM8siCJPJ8HQukH7l6rjZ/XrbrShv/E0gSJpjp3i7WTv
X-Gm-Gg: AYBFou1y1rH9KVyU0EoFc0ah1d8OYUDK4gxGKdTjCImfKP/Ahfee9o/LYFOp/kToSRV
	+BZYucv7gbd+jmdH2+dx8TFXqdkpnAOkeDP6+mD8ZY3GQo3m3GY/Q23PxheXxLPmPD9pkOIFzty
	0e+qWr7ahXyr/0hFwht98cuQtDkpdDNKGr4jlndnNAydbHolGZoxH2aqz6gokyoR8Ue9plnTaHv
	3axD4s59r1Vttq9LpE+W7Tvj8TQ3JEQxX5gs05UBs4oDk5vup6CMG4AeeAvxBE59lZhK2wbxp9Y
	vg9qo5DaN+G8MqNg3UolLiq9lm0idxmcJowjUa33UNswz89dL4ckGOYQrxin4qE1flf9tVuaqUf
	pCWyF0C15lcKyu248rfMqCh7MBBXfBIsySj624LDhh0GQWWgiWfzWk1W301HyHg9SYYEW1BgPr5
	VewwQE4B57KYymieDJaxwb6YaKH6lTEQF3yq2Gn6O0SvI+mEubyatcT3rFRGYJaeV/7nrrTSM9L
	AoLAy1LUNk3/MszJNgeRZJoUGYkgDmb7CH04oN9leCvdXtzhw==
X-Received: by 2002:a17:907:960f:b0:c2a:c76c:c743 with SMTP id a640c23a62f3a-c2ae9f6a1f1mr749798366b.35.1790590106798;
        Mon, 28 Sep 2026 03:08:26 -0700 (PDT)
Received: from rillian-arch.localnet ([2a00:23a8:8f4:6a01:5ffc:da36:c891:cd3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2bf3c6ba9dsm304459866b.13.2026.09.28.03.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:08:26 -0700 (PDT)
From: Rillian Grant <rillian.grant@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, lee@kernel.org, linux-leds@vger.kernel.org,
 conor+dt@kernel.org, robh@kernel.org, Rillian Grant <rillian.grant@gmail.com>
Subject:
 Re: [PATCH v2 3/4] leds: flash: lm3643: Describe the LED of ACPI boards
 without LED nodes
Date: Mon, 28 Sep 2026 11:08:25 +0100
Message-ID: <Spi1SCcTSB2Ab7fZGVbFXQ@gmail.com>
In-Reply-To: <20260928095015.096591F000FF@smtp.kernel.org>
References:
 <20260928094302.86966-1-rillian.grant@gmail.com>
 <20260928094302.86966-4-rillian.grant@gmail.com>
 <20260928095015.096591F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Monday, 28 September 2026 10:50:14 BST sashiko-bot@kernel.org wrote:
> The subsystem rules strictly mandate: "Only log errors or warnings." Since
> this call to dev_info() executes automatically in lm3643_add_dmi_leds()
> during hardware enumeration on matching laptops, it will add unnecessary
> minor log noise during boot.
> 
> > +
> > +	return devm_add_action_or_reset(dev, lm3643_remove_dmi_leds, dev);
> > +}

Agreed. I will replace with a dev_dbg() call in the next revision.


