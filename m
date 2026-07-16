Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336673D410D;
	Thu, 16 Jul 2026 11:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784199741; cv=none; b=OjEIWcvJhk4521ow8+xoLOSGBCwpHJd3el1Yam7BNAzUuOwGR06kELMUpYB9AabcCa+l5amoOYoMCDxe7ivMWw25AvXHJGw64L8otWyu/eQV5+jM480dYPeizJDHkB1+TpKJB/sfTe0AcXs+98AcOQ2c4H4CQDmxQW3dY9kdRzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784199741; c=relaxed/simple;
	bh=weglkylga4go7iUdRCKyCNLvh7z5pOV4FKb8pIuhERI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SS14otI2uudh46IZvLBKFxi+IkkRxHD27c3hBXnsQcgbLPutvmnJfUUXwep/eb546amgQLCFTOFYZboPNI6wsQ/zVdNGBoEKcwyPogCVkX1LsPKzsCn63x6Fxzhun/49PGenYN8nX5zqVVfTFl31eLMVLxJyRgEmsKGEB7lVfko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FIGf+TL1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FIGf+TL1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8283A1F000E9;
	Thu, 16 Jul 2026 11:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784199739;
	bh=6nnmo/F1N1BR3ZAsLT77Fh9RIM/5mhmAJ8ig8kx0k9c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FIGf+TL12hw9Y1OZkWdlvnyP8NlyvXz1zoY2H/5seIXqs+HA08EHSOqxiZnFkrqq1
	 ymv2gYsDmSt5bMOkIEDb1Egi78rgoZmcqwsdNFnTz+YMYunocK4VwyQf9qQAVh30Y6
	 M59nQGwBgT11zApwGIORq55xe/c0y3rqr3MDkWxsyRSvNOz+0fvDp4koFtCgQVUeva
	 a1cU3kAAK3AKo5P0+2nn2XRg6ropCT7SbuvVKlDHuCKMtEQNExrtaDv4a6iMBtDZrm
	 4wSzbwtQIf1yfxWAOst66yX41kQ15fr6xiZL0NqS8ByBt9y88bzk0WsSApWh9zU1y6
	 mAXy8v2LjQV9g==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manuel Ebner <manuelebner@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260710112529.435341-2-manuelebner@mailbox.org>
References: <20260710112529.435341-2-manuelebner@mailbox.org>
Subject: Re: (subset) [PATCH] dt-bindings: Add missing bracket
Message-Id: <178419973728.1276269.15658607490515790554.b4-ty@b4>
Date: Thu, 16 Jul 2026 12:02:17 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Fri, 10 Jul 2026 13:25:29 +0200, Manuel Ebner wrote:
> Add missing '};' to code.

Applied, thanks!

[1/1] dt-bindings: Add missing bracket
      commit: ce6fc04113241c82a698f362f8dc6e1cc2f65448

--
Lee Jones [李琼斯]

