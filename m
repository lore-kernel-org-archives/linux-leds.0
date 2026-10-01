Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB0847CA9E;
	Thu,  1 Oct 2026 06:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790837132; cv=none; b=YNmk5B6sLbbBnZnjVv6NhCU2vVxP6CYxu6xMl7FQeAE+TQ+esRGQQ1JH6Db1+xrYUxF1XCoRXz8vA2WG18bxpkOm4tGMYUaqR2GF089gUNaPfiUYJUq027ucsm2QKavbry9u90S1kL79ldevXrwEhic4VxVn/xtlOEQCgivWOE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790837132; c=relaxed/simple;
	bh=v8uG9Smink0uRFJk2fnGacVV8dxbQbtmUsiGJbhLD5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SooATQVjAz5dmTk/BZxpjV81mmUvLCm/t8xa/RgXNBz/nQbG0IAAJyxvAsPZD8qQFglctfK+BgAu3h7TVSVd1AW1svbsEmx0FRMy8d61YHeNmDR5i8WL9Q19zC04V1vuV5UCAWNf/1kVe677bxlrz08cyZdRxqKUYDFdewpOyjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cXCq557w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cXCq557w"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 241A4C4AF12;
	Thu,  1 Oct 2026 06:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790837132;
	bh=v8uG9Smink0uRFJk2fnGacVV8dxbQbtmUsiGJbhLD5o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cXCq557w92QUNnsECXKIuQRzmcEN1Uyph4hA9FvdsW36F65iatvPnocfB6CuHJewh
	 IrpfjgFJPRgQ4Y51faNpMTrEzjYVQ9vkqdy8Y7nYMfeJiHIgCEKlQNunmGNxsNoSai
	 PHTSC4VcuEkRWUcg6h8ShzCI2IXEKIx1sdx5BFi4ZeVuVIBCXmHhKglLb+8jHH0PVt
	 dDxLbyIOGVBj1wyU9wWLz1ekuYCajMrCEPXm4ViLi+nPTid0usnn+MeBnRzdeaAIxF
	 8JG3oE5JebNbIk2zoL3UpD9McKTJnJTLNxx9nLE18Z5HeXPBE9gFcw5mNqpJtK5Fs+
	 DpkOx/0+HU+fQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BDBCA5FB3;
	Thu,  1 Oct 2026 06:45:31 +0000 (UTC)
From: Wayne Ho via B4 Relay <devnull+wayneho219.gmail.com@kernel.org>
Date: Thu, 01 Oct 2026 14:45:11 +0800
Subject: [PATCH 1/2] Documentation: ABI: leds: inverted is specific to the
 backlight trigger
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-docs-leds-abi-trigger-attrs-v1-1-54f0529bf0f6@gmail.com>
References: <20261001-docs-leds-abi-trigger-attrs-v1-0-54f0529bf0f6@gmail.com>
In-Reply-To: <20261001-docs-leds-abi-trigger-attrs-v1-0-54f0529bf0f6@gmail.com>
To: Pavel Machek <pavel@kernel.org>, Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790837130; l=1162;
 i=wayneho219@gmail.com; s=20261001; h=from:subject:message-id;
 bh=1kSwJWvbUgMk5BRB5AL/9PD/agaA7eFnk07FgPmlgzs=;
 b=4Gnq8XKnv0dE9+gXX1PvOlz68AZIlNAO/k8ZgC8MOag6pRcjb0AlMRUxifGXbfOK7EZH9mF7i
 qzIk5sF6U2fDml+Xjmqr9MRHovpHFTYFVJTFYgYacenFskq7/Y8pv4H
X-Developer-Key: i=wayneho219@gmail.com; a=ed25519;
 pk=j25LRSikYRlv0PpovZSgSrCQwsy7WDzIYum/mydUa3A=
X-Endpoint-Received: by B4 Relay for wayneho219@gmail.com/20261001 with
 auth_id=1093
X-Original-From: Wayne Ho <wayneho219@gmail.com>
Reply-To: wayneho219@gmail.com

From: Wayne Ho <wayneho219@gmail.com>

The description of the inverted attribute says it is specific to the
gpio and backlight triggers, but the gpio trigger no longer creates it;
it only provides desired_brightness. Only the backlight trigger creates
the inverted attribute today.

Drop the reference to the gpio trigger.

Signed-off-by: Wayne Ho <wayneho219@gmail.com>
---
 Documentation/ABI/testing/sysfs-class-led | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
index d4c918cc..c72cb1e0 100644
--- a/Documentation/ABI/testing/sysfs-class-led
+++ b/Documentation/ABI/testing/sysfs-class-led
@@ -84,6 +84,5 @@ KernelVersion:	2.6.38
 Contact:	Richard Purdie <rpurdie@rpsys.net>
 Description:
 		Invert the LED on/off state. This parameter is specific to
-		gpio and backlight triggers. In case of the backlight trigger,
-		it is useful when driving a LED which is intended to indicate
-		a device in a standby like state.
+		the backlight trigger. It is useful when driving a LED which
+		is intended to indicate a device in a standby like state.

-- 
Git-155)


