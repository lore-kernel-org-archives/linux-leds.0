Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A2A3F926B;
	Thu, 16 Jul 2026 10:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784198524; cv=none; b=SQ1v6CH7UQUdmKb1EsHBFSBGsGIOYsIGO04kNHv+Kuc8SEMN1AXBDA9KFhhtErZrsd0FIcVEVRAOHZ+K860t62Z+WUo7RwHzs6uq9g2mVUCBsLi2iqhf+v5OO2vcwpCdI9d/FqdrULHN0+WEC+K2kKybNxKiuympWHC0zqxF1ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784198524; c=relaxed/simple;
	bh=7GRDmxkKOvXMSahYh6jrAQ/1GScN0TCFfZgZwBD/wbI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=psSRsCLnBuqMJVf12AmlStXg5m1plnAGrcIKwifNxzjHHkhwtk9iAhvngvbNFUi8rBuzXOu9npqvVA6uhOYMDi6b+GECYdF7FAtF5w10gjfBuif+w90kmDFZbU5O5Pd1w+dfqT7QPxXH3o0XqojV0PJgpFdvZR3VWtl2X7EHr/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cWpSswwZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cWpSswwZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4065F1F000E9;
	Thu, 16 Jul 2026 10:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784198522;
	bh=ZxkAPkC3WXfzJ+jrm3dHu5tnYfHhVvaTEHLkTVNbU3s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cWpSswwZ2bEb12NpMDDRh3S3qetzA7/F1iP0gnGLzTODpf87XFGhwXVYr6wxeFvFD
	 QEBPPFYJGYDavyEhlAHgWvc8RjwW4Bm9SZnpMlwFUi3fzdPxsOCWNtsHYG/tPDYfTB
	 f5JM4J1OaohIVnCZ0TyptCXWbnivstKEwffVRZMpNi2qiyXgaQS2PK/70mbTUD+b/4
	 2QnGTsrtmg176STrQD/WkJbM8L+OcvtNaJbiG7JIOZSXaS4G18acNENmhdu5IQi60/
	 Cbihh/zTqqNg5QAi1Ngy7IAVn5n0ad6vA5HPbsuNY+gaF20ymhpGRqMBhUwsAytq+w
	 vrrXh+pp7urYw==
From: Lee Jones <lee@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260711192842.845048-3-samuel@sholland.org>
References: <20260711192842.845048-3-samuel@sholland.org>
Subject: Re: (subset) [PATCH 2/4] dt-bindings: vendor-prefixes: Add
 techvision
Message-Id: <178419851981.1265391.16595891427832466278.b4-ty@b4>
Date: Thu, 16 Jul 2026 11:41:59 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Sat, 11 Jul 2026 14:28:26 -0500, Samuel Holland wrote:
> Techvision Intelligent Technology Co., Ltd[1] aka Shenzhen Huiwei
> Intelligent Technology Co., Ltd[2] is a manufacturer of single-board
> computers.

Applied, thanks!

[2/4] dt-bindings: vendor-prefixes: Add techvision
      commit: f0e0417373ca55d07cba596e8afe081c078843ad

--
Lee Jones [李琼斯]

