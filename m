Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B93F3E4C7F;
	Thu,  1 Oct 2026 06:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790837132; cv=none; b=Ii2KtdhP/mS4usVfoM7VTTHF+gu0XKCPpLWveSMapr418/GIZ0tZ9VoDhsuMmnQTiaYtbSuPp/SPL6MstJIWUxRZ+oOrSjs51aP+QRdf8tNQMZDJBACXkJ5Pe3izRg/VsdRKhgbi7wk9meRAqnvqkFUKEK4r02OP8h5cuBcIRLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790837132; c=relaxed/simple;
	bh=b8SsPNCMf2P/rDCw8LMLQ920RO5dT0DnJ5JXyQUF93s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bxduvlkFPlm8dD0tG2+pm9zuGDgDSinfPWIl8m2OvVpBMLz66Y8h40awBTIZIB73iKCJMIYWdRKe8Zd4pwhd7j2Yt6ekcCai6ywaU8H8mP8aOxXPVuqKIoRPrN6cW3er04CVYfQPc3P4TM7luOMCql01hpm2Ua12H0MAcQHh82w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tOuix7vT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tOuix7vT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15CBEC2BCC7;
	Thu,  1 Oct 2026 06:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790837132;
	bh=b8SsPNCMf2P/rDCw8LMLQ920RO5dT0DnJ5JXyQUF93s=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=tOuix7vTkez/ygZOiuvvstV+9lwyEQ7zqxJkeQypyUoU9UhZNsPTx9vcISAFWY4fJ
	 RFfA/5QoaB7gR/Y/Q5+Rbkwfi9s/RT4fV9z0h2Vm7sc0P3pBo9hr64piTstPQzRS4z
	 7qVlcTEbzuK/aAEetbk0cdioGNlgteHgYSokmT4xXTdaAMr9+w7mxP6aDc7eoo3Vmv
	 FZixf5zy5Va8ILaBv9uzDQzmzHnKj3N2w2JAj/j1mISVqWxZgOTFwH82fNJnS/ykub
	 RlKajVnNz4QJOkGthsf2z+TLFkXLsaluRSta+fG7ma1+ev2ReC++qO31Ogzj89tMs+
	 pMes3NR2QaUsQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1277CA5FC5;
	Thu,  1 Oct 2026 06:45:31 +0000 (UTC)
From: Wayne Ho via B4 Relay <devnull+wayneho219.gmail.com@kernel.org>
Subject: [PATCH 0/2] Documentation: ABI: leds: document shared trigger
 attributes
Date: Thu, 01 Oct 2026 14:45:10 +0800
Message-Id: <20261001-docs-leds-abi-trigger-attrs-v1-0-54f0529bf0f6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQqDMAyA4VeRnBdoe5Dpq4wdahO7DNGRdCKI7
 27njt9/+HcwVmGDvtlBeRWTZa7wtwbSK86ZUagaggutd84jLclwYjKMg2BRyZkVYylaS3BMXdv
 dPRHUw0d5lO26P55/23d4cyq/JRzHCaHdwIp/AAAA
X-Change-ID: 20261001-docs-leds-abi-trigger-attrs-a20ed96981dd
To: Pavel Machek <pavel@kernel.org>, Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790837130; l=1201;
 i=wayneho219@gmail.com; s=20261001; h=from:subject:message-id;
 bh=b8SsPNCMf2P/rDCw8LMLQ920RO5dT0DnJ5JXyQUF93s=;
 b=F+x7/1B3ov1YqCJCzfEEzKMhgItTkQNGQ0b/IDpf9DkVqSKxhvucxbt8ic3WNvVR8e8gf4N5G
 BA/7qNrz+G8AH+MxOa+qs8xE9bobh5FfM7+Qd/AAKPY/1uThVCBoZH+
X-Developer-Key: i=wayneho219@gmail.com; a=ed25519;
 pk=j25LRSikYRlv0PpovZSgSrCQwsy7WDzIYum/mydUa3A=
X-Endpoint-Received: by B4 Relay for wayneho219@gmail.com/20261001 with
 auth_id=1093
X-Original-From: Wayne Ho <wayneho219@gmail.com>
Reply-To: wayneho219@gmail.com

The delay_on, delay_off and invert attributes are created by several
LED triggers, but only the oneshot variants are documented. Adding a
separate ABI file per trigger would make get_abi.py report the same
sysfs path as defined more than once, so patch 2 moves these entries
to sysfs-class-led and describes each trigger's behaviour there.

Patch 1 is a small preparatory fix: the existing inverted entry still
mentions the gpio trigger, which no longer creates that attribute.

Checked with tools/docs/get_abi.py validate (no new warnings) and
scripts/checkpatch.pl (clean).

Signed-off-by: Wayne Ho <wayneho219@gmail.com>
---
Wayne Ho (2):
      Documentation: ABI: leds: inverted is specific to the backlight trigger
      Documentation: ABI: leds: document timer, heartbeat and activity attributes

 Documentation/ABI/testing/sysfs-class-led          | 73 +++++++++++++++++++++-
 .../ABI/testing/sysfs-class-led-trigger-oneshot    | 29 ---------
 2 files changed, 70 insertions(+), 32 deletions(-)
---
base-commit: 5dd1818b15d98d4a20806cd00b1b40320b06004f
change-id: 20261001-docs-leds-abi-trigger-attrs-a20ed96981dd

Best regards,
--  
Wayne Ho <wayneho219@gmail.com>


